Return-Path: <linux-arm-msm+bounces-93863-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EOxZBKoTnWkGMwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93863-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 03:57:46 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 69C0618131D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 03:57:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0F5C5314B1C3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 02:54:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91B311E5207;
	Tue, 24 Feb 2026 02:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J+8CcWas";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QjtcYK5k"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BE5A26056C
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 02:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771901682; cv=none; b=VkiVWrrmU8JGppZRaSvQivb/q8u0RREduzzhVp94hXCShRwdxFFjZfYEOrXNeLqY2Nvy0SL3qje4JcvWqJdf/uhpPLVVWVg3YVWX8debJIR6+fQFkXWBMJ83UvCxWrlg4f4nbdSDbVOX0vUqrWKWG9GU2qCykYnpWkuOkGGAjmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771901682; c=relaxed/simple;
	bh=97BStdsBeGjMH+sbVb+a4ttP+PpeCTMJEIxbNP5KQvE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gq6XpEFZtwgj3qcRkgusKo0oi+UsiW6eJD8kgBmPB4UOYj1RTYSNYQkSaNvLUUQakooPMtpSwy4Nch45h9zR1gx9q0IXSs85cYWGCqklGpp6J7UN/GZPaMOyEHE34UZcfLKu4ecEvTnU/HJdUn3wVfT9JMxiAcsyykS8ok3KKOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J+8CcWas; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QjtcYK5k; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61O2mHUG2613388
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 02:54:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=9XkSecYegMEin3q3aKMY8xXg
	OWy0NXAxCU1kLloVpyQ=; b=J+8CcWas8eorLY/K61Se6qPRTOdjPY+BWy6N1MnW
	7WlIBkGW7sSFjfMupPzqVB8ySGAnM+b1ky7JGyFkihSQiOv0khglT5RFcVXJu+79
	P8DTqWympek923AXnfPX/pyn8mFEu+WxTRi8quWiEqKPTYC75AyB/z2JbmU4XyP/
	Ct3uxLWIiLesYW8isnc1KYewZ4OXefTFcGBWuVFbGcDwDIprbdgw0hLrDL34colM
	S8Ezr4xbbBoADSjGMyJwCHCry0MA8eTgGMAkJJPZhjd/qYC9ASFuDbIwToMtR0Nl
	exw8aYyXv0LcW2rXuDbVjO1nOKwz+FoIGzi+zmHTb1JVdw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgn8ran3t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 02:54:40 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c71156fe09so4157179185a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 18:54:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771901680; x=1772506480; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9XkSecYegMEin3q3aKMY8xXgOWy0NXAxCU1kLloVpyQ=;
        b=QjtcYK5kqlKMoMRv5dX1kPXNIUXiZrFmfkCDFLZrdp8t82KdHHggJa/ZJEpOPVMUD+
         seth/bCdYYb/zKTU6r6YN6fp2A5XygDrizWmUG22dj2Wa4GIc4maaT2JnToNpz6bybzJ
         OYYgKSJQxmKsRAIhht6AtQ/ZevOX6QHPStpm4n60TKm6GrFh6S5SopMbLuY2xSlkPeJ7
         E80uGOodB+/BD1U0Ayy9GQuOcygM/cYt0n2Cxs7HUXjt/SDhvDQ5ehIuCrq/XuKS7e8b
         MSTALWNg7ohgpHxqKh1PQEkMX5aVtNFHOZHVlHel5GDgIxI7m/oksV5c5AdDcuFh3OeV
         c4Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771901680; x=1772506480;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9XkSecYegMEin3q3aKMY8xXgOWy0NXAxCU1kLloVpyQ=;
        b=hyApT1EcKRTpJ/YPMCxWTMZKnv7mVjW+VLhKfI6z3wt+HBjJl3Yl3FI6fD8czEaHlW
         OH42kfX+nvh8OQRB2+7Q7KPz3fUR8O+lr3YDu97eNChqyNArThfdFOowZx2TvYz/mxBG
         uowuaKteHTZ9/Xl6bFjrLJGkUtwJlipwxqVJ08yFL5ukVME75PM5t+MtT6JVi52j7uhq
         uWtNfRqpGOZriL2Ws6/c1HjxHH2CRqnTmNW8cfZVYPRfuaclj9w6uxFomefelh20vyxH
         llWPu6tdbnAP+3NX5ejbfwVwA1sJK9lE1X85ZomrL23DNpgi1awao3ov7UWQumqe6LtU
         cdEQ==
X-Forwarded-Encrypted: i=1; AJvYcCV6azDwPe9mTY5Rq+7RPree30NUn/okfbw5vgLdn+pqS6RAt7Xv9dqkyJDwsSj1ciXjsS2G19Sv5cV5qHd5@vger.kernel.org
X-Gm-Message-State: AOJu0YzR+XhFf0KBJf4kcYg3+UOMHFcxyNhlCQYgVlFq+DU9GQw/T1YH
	rNbczqXE9wkk8lwR+wCFi3qJf22E+esLVWnbWTDN6hyWrDUrwN7+mWqnDn1hDEhRHM3qbJvqKdh
	t9kLU04A6pswrZ7/nvhmjrJWT7r1c7jRjRxOwawkMsyow9BLig8iH51SrHzba1bpPRT9Z
X-Gm-Gg: AZuq6aIkZCbxCBJPX+cvgyXcnOrwfPE63G+9CwPSp1DiH3ZKU4+XPS3JsjtpXBWJYXG
	6hWJrP6lWfWBoNNgT3gBuZazn8uqQGBAlUSRV2DlOCR4mCl+o5BibFeyn+1uB/iKgfxjVI3FjeF
	jC1u9ZhD7NrSfsp/tVKybo4IEJjLjhIKjTV6jPz/YNjnQjcU2bk97jGKRgNhMqx1WIWF+byPb5w
	tPXmRCIVPX5szBxD3Ff+Yp7tUGxMX3LUhNGtMo4MsNC7U0FjAB/JEO4Lal6BdRaL5Vkn5ayneoz
	KayTF6KlkqG/SMxxgB1BpZgJTJTFlU61NngeAcV3eao4/Tyk4Tf9Td/Gfzd7qev8vGoY4uKCK+S
	HyyREur60bXs9lEF+5VD+cmnWPEZ7E3L3Qi9L3HOK0C+gEs7SbuJp8HgL4GGNcUKozGlzN9OJOy
	u4GJ0yeXC++Zfn+MqlCaV4BItX6uy8IRd2owI=
X-Received: by 2002:a05:620a:1aa6:b0:8cb:4d05:aa43 with SMTP id af79cd13be357-8cb8ca8334amr1285552285a.59.1771901679758;
        Mon, 23 Feb 2026 18:54:39 -0800 (PST)
X-Received: by 2002:a05:620a:1aa6:b0:8cb:4d05:aa43 with SMTP id af79cd13be357-8cb8ca8334amr1285549785a.59.1771901679321;
        Mon, 23 Feb 2026 18:54:39 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a0eeb16302sm1921315e87.38.2026.02.23.18.54.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 18:54:38 -0800 (PST)
Date: Tue, 24 Feb 2026 04:54:35 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] arm64: dts: qcom: lemans-ride: Drop redundant
 non-controllable supplies
Message-ID: <leyth7cjzpfcsyhlyehezvonhgkzvy4xhi2xdlrburkup2tdjz@ghnbl3tq6kqp>
References: <20260223-qcom-dts-supplies-v1-0-f90ac885b3fd@oss.qualcomm.com>
 <20260223-qcom-dts-supplies-v1-1-f90ac885b3fd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260223-qcom-dts-supplies-v1-1-f90ac885b3fd@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: GiL3ttb5MTIhqokBmhEHI_x29bA5IMoB
X-Authority-Analysis: v=2.4 cv=V7twEOni c=1 sm=1 tr=0 ts=699d12f0 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=YQIQ00YL77e8QyTPvtEA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDAyNCBTYWx0ZWRfX/CZm3mXFiAWy
 jLNVplDq0lKgs9gworeM0iNqkt2Vn5PYHcwe9HmkwRkurqLI6+hsVDr0QRpGtRnUtobxgs+6NHH
 3rqPvQKMAxLeRWR+8P2MggpLiNpRVLzakFrnUTsSGxcIWxoWkpQVP7DK1dOXsXCpjBqeaxzNREi
 D8PCy4eY2eehxdxY493pcTCpAlarQROK/dtt6q7TCRMuLZL6BJB2YPbRlYIUnTlR9CudyxuQ/hN
 lrm9gzdDK+gbwY56Y3EB/El64QXXCScVuNBF9rRWk3PzIp7TM8kFKmMl/EB3VuerTil+xu3oVXb
 hO6FCDrq7ntDG33mgelnqwkBkzh9GCuA+cSYi3xR7husD4jqKOwmHDgtPFdhIpyXOUjSJ8sNaa1
 /v3yy1mCWIL0QsCPRZdW33C6bsnUqB0Ppu7tl2Q3GpS8SqlT1MQSzJLH87QAV5FP+Y0/SX64X6C
 utDQ78fdskjvqclzYGQ==
X-Proofpoint-GUID: GiL3ttb5MTIhqokBmhEHI_x29bA5IMoB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_06,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 impostorscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602240024
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93863-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 69C0618131D
X-Rspamd-Action: no action

On Mon, Feb 23, 2026 at 03:54:17PM +0100, Krzysztof Kozlowski wrote:
> Drop completely redundant non-controllable chain of "regulator-fixed"
> supplies, which serve no purpose except growing DTS and kernel boot
> time.  They represent no added value and because of being completely
> transparent for any users of DTS (except the bloat), they should not be
> represented in DTS, just like we do not represent every transistor
> there.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi | 26 ------------------------
>  1 file changed, 26 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

