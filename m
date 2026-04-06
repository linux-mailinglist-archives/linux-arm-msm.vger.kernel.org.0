Return-Path: <linux-arm-msm+bounces-101994-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CB3mK1MJ1Gk1qQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101994-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Apr 2026 21:28:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 57E573A69B0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Apr 2026 21:28:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 30954302768A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Apr 2026 19:28:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D08B396B60;
	Mon,  6 Apr 2026 19:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ggT9tsLG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Dib/LRtx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A60F390988
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Apr 2026 19:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775503689; cv=none; b=ukgJHKETjczNUFRCkKSR6eTjjSx7Rz4pYRGRiwloeSjJ1AxM+Phr4prxNKs9Ia7FO+IivIHOTAg8h8XlEp9HtYVmCwctnogtow3Us+Esgan5e/z3GzxnedEmJivwmB05bRjDau1xA0+GoS6eyi+BWIITK5uqlx5X+6eZVrMtMwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775503689; c=relaxed/simple;
	bh=Zv6fes1kojIHKKKul38nWbUFu2oxWmXjxpCtEeUOdz4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jxtWLHsGPEkuqIzcTsMwgpKr8EqE1VKtbfx/bHZzo8lXf07Jt61a50rGCGqCv7ueObayaruDvwViW02Rpm1cMpjAMiyT6EVZNx6Gn26DONqSAWbISVjGyeVOSSkWP3Wmjz+A0OzvQGsjQnpWehjjwK+S4++GvI55xWHXHc2ro1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ggT9tsLG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Dib/LRtx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 636Ifiw11659785
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Apr 2026 19:28:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xEB4rg1IxEHx8EOuLUHNP1KV
	6Y7uV2T4GkkjH/HTEnk=; b=ggT9tsLGxGqHhS3laSsbYxAkcda4aKstQvCcAg0t
	GOszp2Nlu+nEUeiBp9YuGEeyo1K9vuSQsKdXTdKLmEhv1pl/ny90BqqNpPlCNYLL
	7hyaSB25GH8J5AypsXbG8C3qkBjhVJZ7BKoriZ0RUf9NjzmONnyJfr/eAJkLk1Sp
	SGPW/CwEi39PtitxQofLC4zb1+6hCIICmZH4DO/JZ7EqlaFqBbzqKexEk2vS9/DH
	cLuGNAMkkntBpt10c924TNxQgJpJO6AGir+uJf+UIpzvG30f+5+3YWrEHLg6EBeM
	PxkNCFmwqhx7SnY5T62wIX5ISRAzxcUIPzzJsq7wVal0dw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcewerxev-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Apr 2026 19:28:07 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50d826ed6f9so45856261cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Apr 2026 12:28:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775503686; x=1776108486; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xEB4rg1IxEHx8EOuLUHNP1KV6Y7uV2T4GkkjH/HTEnk=;
        b=Dib/LRtxSSrKT3Kq2WmiJAvcT0wSKE/wgUKEsN70jb88cFq1EMIaNU9X4wj8KNs1wC
         YCyyeHTLPgOMRoDZun1UNXiIhf1A7gDiPBdf/GR85kOlAXiGx57ZEwlWq7oHE9r6K8uE
         kNLQqyTOSLp45Cr3rhyu1izoPbud1895WOBCrjDnqTk/lw/O7rrQrmUI14U0fE70dCy6
         mNMbuAMdZF7zvIjmhMNa9moT5/yxa28o2RHPKSDWh9qZpPfS11I4d1TbuZJ0RK2Dsq+j
         0N0sFlE9PvSXqHUNo5cfakQem1DuB9hU34yeM0bUkxGerWIJsI/U7AV1+MF/q7shwvQN
         Ffrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775503686; x=1776108486;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xEB4rg1IxEHx8EOuLUHNP1KV6Y7uV2T4GkkjH/HTEnk=;
        b=TQtNRWd7QksKiJ9D7I19PsUE0axnUAn++KeE0Qy/7gMMxi7WBcAQ7k1BzMeepiFvwZ
         pRXhzZluNwvFLvJSF3eslSoc/fHdvZ3SlaRRpR+HbxvkxbjxCH1YaroMITxc7U5X8ap4
         0oN56JcyKiGRnk5KR1Zc6BM+tNRT0JNae5iSTEr9SDnlkThjbdRjhLHgvpe1OSiv4Uqv
         cxQBILmtSi2MxngOOgKb9BNDxa9TJjlNgpxY9VXYkvJXWoE1BLZ327fzMIvWqAjXmECH
         kGL0vSHYI7hFPiAjcdDv/ZEsj7O7e77+BS/bXD/gdIw5IRsk+/stxdgHF8oHJU8mNR4N
         pgTw==
X-Forwarded-Encrypted: i=1; AJvYcCXRXQg50vkGIBY5mzd63+lL34Ddtj9bHpryI5Aq8/nww0FqeohbZrxstjYwIyDian37mckjrBkQmX8FurNV@vger.kernel.org
X-Gm-Message-State: AOJu0YylryBBsjM16ftK1HBRbrUNMSYS4ztnQkD8vZG4jJiwP+AM9JTw
	AS9S2T4whw1h5rbfguHDaYakQdl5hJvnk57oj7ESxUhdL1i8zhQLGMreXqmyrPg5VOcJrQin4ey
	8JH6mcJDNddIU1UJXeuZvsRTuoHbCG+F7s1AlyIQl2g8bIzqAFjl+Wu/lTkBKSN7/MZ7yKNcbFC
	no
X-Gm-Gg: AeBDietoyjvRY/KDV1/Sg8L3DAC1rRJjX3TAJ/P+Bf3JIm7JRy1SCT87pGNRI4saevY
	qI4KSYWqSLozFBdsCqNXdcWn2xef9nBHmllb2jDvjTk6b3+BqJV+ssyuMVgZzgUMwA0hH7/fV1v
	sy5VSVMFeX4ASXuAb8MtQXSgyvDEMMUyHnlCpGfrUnCmMUk7kj/K4LVoDXfIousWlI4gjL04Upi
	w5Oa0osTxhZEwfWkTdKnh9TkVVCnE6iYS6Mv8Y3yElS4qVwbWsKJ/E8B6z0RhBIYfkGpRbU5Tm/
	/FsuxcM0XBmUbIPXyeU+Vswk2GwQu9/00zTVWTtWhBOlrh6baI/pPGem+rGN1SU90w9OnAC45VJ
	vBxDM0cPYqW3EHy5bx/xi21vHqCM8a379wmefZq4glDxrCCAYwrtYCpnODFAUEZIFDLedHRyh4Q
	39MfR1I+3FhsWKJ33YuPj0Z7NO187RjfsZeCE=
X-Received: by 2002:a05:622a:2cb:b0:50d:987c:8174 with SMTP id d75a77b69052e-50d987c868emr36248481cf.4.1775503686334;
        Mon, 06 Apr 2026 12:28:06 -0700 (PDT)
X-Received: by 2002:a05:622a:2cb:b0:50d:987c:8174 with SMTP id d75a77b69052e-50d987c868emr36248041cf.4.1775503685751;
        Mon, 06 Apr 2026 12:28:05 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6c95288sm3628908e87.14.2026.04.06.12.28.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 12:28:03 -0700 (PDT)
Date: Mon, 6 Apr 2026 22:28:01 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ronak Raheja <ronak.raheja@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Subject: Re: [PATCH v3 2/3] arm64: dts: qcom: kaanpaali: Add USB support for
 MTP platform
Message-ID: <3hvkfg5en2bxlljcryd2qkpunhbxdc5m4ish2j3xkbq2txha3k@v7ipzvhery4g>
References: <20260406174613.3388987-1-krishna.kurapati@oss.qualcomm.com>
 <20260406174613.3388987-3-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260406174613.3388987-3-krishna.kurapati@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 0zVce3TXJ2ED2QnK9R0ICTeQp_upThDE
X-Authority-Analysis: v=2.4 cv=E4nAZKdl c=1 sm=1 tr=0 ts=69d40947 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=YTqrmQZhOYAkcZPAGwYA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA2MDE5MSBTYWx0ZWRfX9ftTf8mbH3y6
 vJimVQ3iz/4Fi1cZaIFmOGZA9qOn3Qyah1YT2opLYUqQDnwDE1zYlu2DkkkvjoPz6czS0hUOG4X
 Qx+gtutySP6lILqC6Bucl/z+iPQGeM+UMHPa0lzIxtEAvgHa6d+RQ2ag4OVDAidG+f4ycmR+W34
 JPBbOQoc2DRcFMV88LXkJgx17ldS3Y5WO3oO9DzrawoFNyJVp5qXIxGrHcLnebaQJYqmx82wNy4
 rI8rUy++2x8JS0wpQ/wUT4qYKLcNcCPDP5oH1x3p8k4sz6fUj7wHqtui0gP/exGnoafjF7Y3Hsf
 1kJVQex8IXs9RcGtAnVvW6K0sxKIFSo5yDoDQOearYKxgP35xvLlwyIdryGeOaZ3ejv7Ee0rCoP
 pU+wJ4QlOgJGdoTnrvtXZJfqBDyKnK+wGtGJMzIfYyYu88zaTS46wFv9hHYLeAu46XT5pFfZ+sM
 1ErMXEhU1e9uGwDSuEA==
X-Proofpoint-GUID: 0zVce3TXJ2ED2QnK9R0ICTeQp_upThDE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-06_04,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 impostorscore=0 clxscore=1015
 malwarescore=0 phishscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604060191
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
	TAGGED_FROM(0.00)[bounces-101994-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 57E573A69B0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Apr 06, 2026 at 11:16:12PM +0530, Krishna Kurapati wrote:
> From: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
> 
> Enable USB support on Kaanapali MTP variant. Enable USB controller in
> device mode till glink node is added.
> 
> Signed-off-by: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/kaanapali-mtp.dts | 27 ++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

