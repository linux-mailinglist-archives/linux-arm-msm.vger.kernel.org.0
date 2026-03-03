Return-Path: <linux-arm-msm+bounces-95144-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6JgxDJXjpmnpYgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95144-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 14:35:17 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 86D8C1F05CE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 14:35:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DED18308F83A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Mar 2026 13:34:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E84226B2AD;
	Tue,  3 Mar 2026 13:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vc9YYhxE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hcSJWwsU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BC6E2248BE
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Mar 2026 13:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772544866; cv=none; b=PNAUTREJbq4v3Cbs5SYvYGscbXW64tUg90iioyAMVBoqiSNlcA/y8EmcOibL5THS6dujChJW1AATJpms3IAMYs5oxlNy5RFGjhvUfcS0TMQSGTpdH534HZXmUlyeFd5b1JkT0gjImHlgfIO+mH0leSsR8YOgx8I+5fV/r9hAedI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772544866; c=relaxed/simple;
	bh=SlNjouqKABxmzV7WrTdzdHU7fSvlJK4meO4sv93jZN8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a9/1rRYfkQGnLigzH84I0uSEXgWxVVlFHPt/TLKpLwTKY6GbHi4FRjt1rUJoTPvPywUEf5MmRISD3N8zy5EnUqgtpgLyyFIMWMwvxEbO2jiPatWtkVUvXXSxM+dPGWvOMZ5ELVIffalMNT/GIu4woWNLTgxDpw5owWEXKmW4Tq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Vc9YYhxE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hcSJWwsU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6239mhWe2613818
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Mar 2026 13:34:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ZvBZuE/XomQed/AjItL2PQEs
	Qsxd6Eu+axmB+v0qgY8=; b=Vc9YYhxEI+/K6tqRydAuO1pvhLc5jZyVVVHR+VZX
	JwB9HcGOTXVHuKqG9xBkFXzpSCYSd+i9BMFclJyNaq+yz7TPJx8ApGkE/N8kBuco
	jwa05q02gCv2OlUcFwoleaXvo1s/QMlEkXVlClXAaP6Du+kpZkpJocjqlOChd+kR
	L3MZ5kT8F/4Gd/qKq0xOEaTQDBPXDv0x5k4rwXfDRoyw6Yb2Wb5Jy0yztqXpTRmk
	CtgwDRoAE3tKolli42uAQ8dTWyOAFZbOaz2E3tw/m/Obu9TOgBe7tPxeVopiI1l9
	FSZMgfEXweq0NPGmMYGuj3X8nNqwSm0Ii8jEAa0Hy1HaAg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cnvxf8r6u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 13:34:23 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5033b62efa7so435267121cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 05:34:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772544862; x=1773149662; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZvBZuE/XomQed/AjItL2PQEsQsxd6Eu+axmB+v0qgY8=;
        b=hcSJWwsUzW7bvjkMVi5cIyWFluqEdPXRBiC/y9TgOHsNSMw4w7xeBgS635yDW5LHuZ
         aRGwPouV74IDYhVZNuxkt+ZtT5krRV1Bc4J62qfZc75/3V28/3QXoisBK/lnhoc7Xb5V
         OUKJA8rHnDWbPGtOqQfmGO1TBUSKJ6yeFa76q8YgEU23qQaVThMO+8CXD5tAYRtRZ6Gz
         JbgMBoSZV/UKEzhGZqudh9XCoFqkVFgw/Vly7SjOf8VOaX4pN3pwA4P/t3287c3YCYyE
         FbswSei4pydGEhBlyLtJsPH5P1B+8RyKAIbLh+eL9/bR1iRAHnWxAcdNeCXunA58OiMD
         DvsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772544862; x=1773149662;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZvBZuE/XomQed/AjItL2PQEsQsxd6Eu+axmB+v0qgY8=;
        b=BZEhYN0/0fkmQCZKu+w0WL4oJSQlO+B6110MUSb4WikDqIVwW33oXUKDGHudxTqU3/
         3vMEo5lzk3BjWfoV3MDJb5ciEbhwsykfaiJPDwNDz84cWioxAoQ5JLBnsilktlu+uPxg
         bC7t3IA4W2Skm0hR5qkot3T7BafB/TlDiHqdnhroPSpS0r/kDHpjFsJ3LbB5KUnXjrIc
         yd9Hez7GqOyxuG2ibaYtRSNcQR/MFAt+wu7W/wMx5/FmX23KzBW8oSRje8bMxVwq4DGR
         UQwEpbTrpgipFRyr7r6t7rlRmAV+v4PS98TstRhdqccfM1vZiFGiMqKfFNqHBs5kmF+F
         rflg==
X-Forwarded-Encrypted: i=1; AJvYcCUiK7MWoy2hweBrAJaLNWiApaqNiYsr82tQDo9pahK0Yo/0zrTX31ER3M76vdEtUTSsNMY6pJ+ltJ2B8bm0@vger.kernel.org
X-Gm-Message-State: AOJu0YxQwCt50LTbMDzr4bPE99b04U3MouVk1a+TS92AozKJ8lketHNk
	hW41mD9ZKY8O1BLktSuoz6P1z8QH/SkKnnvi3AWyRK8OlB32PJQMBUMEm1MGABgMaBf+agtFl2D
	eF1Jnf0QnphtmmyKAVtUN1557elUSc/5pfX7zQDzGUHtNI6Unv1ertvbKw8ExV2EC4FJ1
X-Gm-Gg: ATEYQzwS2Hvs3dCROXpfyzWjjb7Oyhf6RTvT4/9JqcN1RHVrjDZdSt/iJ+sNBV8NbNf
	oLP8cGgeczUXHIawgArE1l0mEjP0uSli5GFLaQnxOjPXvxfQ8GIQb8xfg0NvGvsT4taHIAcVm/X
	Epq1OF4mXHoiyrunRQgJPWPpscdqax1VR919ITfbdkUwRxCJ8s+AtpIQwXIV0aRzsxBkaf2Exwy
	r+Ilc3QZnAlqXVR3cGfRaXJNGeMITivXEJxiJO4Yrrk3EQ5GH92l+qu2sIgUODOxc+rcgYBERPJ
	WPo1/AkNB/MRZn/7IGHkE0KWi4T0cG7QyTT9kDf259GYfH+HT+UBQSzHapZzbNJzV4a+LzsrqA2
	BSBkg4jHeFjuCY5ReW83gZauv1/8WQSkZ6RoU
X-Received: by 2002:a05:620a:254d:b0:8c7:1a83:a15a with SMTP id af79cd13be357-8cbc8e01d8bmr1868267585a.59.1772544862423;
        Tue, 03 Mar 2026 05:34:22 -0800 (PST)
X-Received: by 2002:a05:620a:254d:b0:8c7:1a83:a15a with SMTP id af79cd13be357-8cbc8e01d8bmr1868262385a.59.1772544861845;
        Tue, 03 Mar 2026 05:34:21 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439b59723fesm16078037f8f.38.2026.03.03.05.34.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 05:34:21 -0800 (PST)
Date: Tue, 3 Mar 2026 15:34:19 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v4 2/3] clk: qcom: Add a driver for SM8750 GPU clocks
Message-ID: <dnfxxncwfh3jerlxhlbhssv64dfiyyf4ohpoxf2nym4pqxkxml@bptjbzorm3d3>
References: <20260303-gpucc_sm8750_v2-v4-0-2f28562db7c9@oss.qualcomm.com>
 <20260303-gpucc_sm8750_v2-v4-2-2f28562db7c9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260303-gpucc_sm8750_v2-v4-2-2f28562db7c9@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDEwNyBTYWx0ZWRfXzC26EXXjDCB9
 4Is52w+DbvdodjSFuYi06ymRB0LMPtABwe1BREmxq1CkgVtsdBgs6y1nCJtyI671L4LXnNnZHFV
 FMEnXxKrBy67di7FqCwyxZU5//FrGo/7YQvzSOLMDHjJBWqO+tmN3og3MghdAH9oTWuhXBVnjse
 EfccxyH0RZOzMxH6TrZnru3O3o3cLW38jVCuxRHSrtbNG3WYi4NkoHEaiaco8u2ZJP0P26LsWMw
 mHvdKKph6Gtyt+TKnmpca+KtpXy9IjNUtLUSuuPcc1Ykx4dEJz7e3YBhoVw4YGAsQOHWze2UXnQ
 uLml7OmqMftk/NlX1lu0G8KoLHSWRuCyuynLWSGhqHg5zUHPYBHJR25ziwcnzbSIoNL+n/TvChr
 dJjuFh4ATQ48/MqS6x7a+QO0e/rRWMNpzYdYgTxH73GmxU9FudDO3PN+s5697XxnJdSzMCHd88X
 Bz5zu3ngj/NVlmOtosg==
X-Proofpoint-ORIG-GUID: giTZtJzfVAcUOB1Ze4NUNmFMBlH-joWS
X-Authority-Analysis: v=2.4 cv=S+HUAYsP c=1 sm=1 tr=0 ts=69a6e35f cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=-momvpiiut8LGs_r7JQA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: giTZtJzfVAcUOB1Ze4NUNmFMBlH-joWS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 spamscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603030107
X-Rspamd-Queue-Id: 86D8C1F05CE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95144-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 26-03-03 15:05:26, Taniya Das wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Support the graphics clock controller for SM8750 for Graphics SW
> driver to use the clocks. GXCLKCTL (Graphics GX Clock Controller) is a
> block dedicated to managing clocks for the GPU subsystem on GX power
> domain. The GX clock controller driver manages only the GX GDSC and the
> rest of the resources of the controller are managed by the firmware.
> 
> Update the compatible for Graphics GX Clock Controller for SM8750 as the
> GX clock controller is a reuse of the Kaanapali driver.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Co-developed-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

