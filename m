Return-Path: <linux-arm-msm+bounces-92016-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OO0dCEXHhWnAGAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92016-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Feb 2026 11:49:41 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 83AA0FCCF1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Feb 2026 11:49:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A34FF304139E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Feb 2026 10:47:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5262D3644BA;
	Fri,  6 Feb 2026 10:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H76+S9tJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AVC/Zx2/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F3B4364EBD
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Feb 2026 10:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770374850; cv=none; b=hkpju1I1HKjS4F/+ypN+ZC404HZRFEh5djBtZYWLBFlw9a+xIi2VjuLPYVtqXBWrZyB3tO2Ui/2CTVXLWSQ7hJj2jcGCF8+bHZ3/xjYwmv52Hz9eHPIzInF6HUjsA63/W4r2kxeB42QnDNXAkTbppOHrW8xzczYUJC5O76at9y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770374850; c=relaxed/simple;
	bh=pH4JrMELjkEH1KpYiPRCH1OwWi5ZwSBi5ba+w4BJSIE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ebvsXADq3d3dT0wg4TCqAVPmV6s+7/Ld2bMPQDO1bCRiioFfWEHXcnzIOC0lB45O9grU7Gs90ipSDjH3XWbbJp7AoLWSbwz8RLA3Eoglb3fUH739kuuRVaN9YfcDHtoG4KPyapiwZvqC85ovVQ2SJoHWZVXpLtococBRPr6W6yA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H76+S9tJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AVC/Zx2/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6167bcHO4041993
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Feb 2026 10:47:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WiUpfxIFCkcoZA3dEemDTklxSz1/qDPkP10QtK9mdok=; b=H76+S9tJa0+Yypck
	TAXs7XyvPV/fvn8YBBjc6TwsY57q8gLt4jIgm8cmJlS6TyiXSPHxm1jwjRfdJcf8
	7aWN6lnB0p5h+Me0mxkhaXs+XgfExHpbO/Hx50JeUDDZdkMgP2S+C07cdL61AeCc
	b7yKc4f4XgNgcKY0ec/POychmPtq/5YfPusIIDGArAcZZZApnO7RwCzDMPgojOPN
	/WqipRxjkdEGHNWiU2kPdDtijAlS3YRH0QgbdOJIOidpzjb4ZigRIynOLxapLCYt
	H/CdG392reJlQPWn0DfDM3Spq8Xo8qATtKi8j4ieqoN3MO3J+/aKgva+jVvlxbhU
	m4BU5w==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c5c2w0n2h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Feb 2026 10:47:29 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-894662cba4fso6488296d6.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Feb 2026 02:47:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770374848; x=1770979648; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WiUpfxIFCkcoZA3dEemDTklxSz1/qDPkP10QtK9mdok=;
        b=AVC/Zx2/285ho3Ekk02XK2AnMKcW+2M201CIx1gjZIuQFquMAuUvb7hZkQR01bIjU0
         lcUD00+5ElvhS7VMmB8v7tGTxx34mx/uqWt8S33Bozi8Sg2/QujJrm/0oQ3RQ2SLfWzu
         xu5bqjFQMSGJuAILvD+zd1cnabgEdjppzeb+nkrNeZ+O2i5WosiIe1gAt6MeMfs+rqyz
         oB6nSmJJwSDwOcc7u3qa3oCdH1vs+y9MWqTNiFvPNMsgPMW41jygIEw6mD+YTr7GkoVG
         h421l7xlDuySFFxHNYiX4YUweIUFgh/IUuq7lGislvloaGYdU3RGGjzMVHfOOU85ow/o
         +2Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770374848; x=1770979648;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WiUpfxIFCkcoZA3dEemDTklxSz1/qDPkP10QtK9mdok=;
        b=UY021ly1FVHi9YobFCcj7NJR7r1fYSZmLbVE13EjhCXJw9FihziiCEQjBVjedUm+gu
         Sw4XZ2tBaHnA+hm0v9jf0YI1jHaJmnMCie64d5eEi8XiFC9ynNYmVBEvXCRCpeWH5G8j
         fMTd8HWs2UlsXtUSn2ymnljMKmsi2EM07vNb6brMMZDd8ubBcmyVWj6SNgBA5J5q8rXb
         E//fjQh8U24KnwL8gEh/dEI7EqqrVJhVs6z/wgrgNMcSRSCXPUDSCOhik25jctjs1xZN
         OiFfqcrIUbyD+kwlxHmRPHSRJhh87QbVY9zce5cbL3nXHxywhFUwWs2Bn6/4SxnyO0+3
         +u7A==
X-Gm-Message-State: AOJu0YwtM2MYIuCav5FGHLck22roN15BRKbDsJoD4EkOh7G+XWEomW6z
	SitUgWM0DpcEGb2Q6VHYLVfdwWxk5abI3KKmQ3ws+aRmgnDRhM/tkYBDKupjW05Ozhj+0rWd8LS
	I5B5fGBKSXuFFGkSH5gvsGXeiPLWMn2DggoPGj430AbVT8+kOHC5FFPOIw/l1q0r6Legv
X-Gm-Gg: AZuq6aI392Khk27/ZucN8BBBfpks1kR6Sjb/hoxOJ7snZ75OmaXbUp9VjI/ddQYfaIc
	RB/su9AukernEfYyXkHy4GHJ+U/kIvMwF1M9Uud+XbzVD+EB5cMVCLB3nRhjT+/kVMWAnbEK+Ok
	rcQiPV7C96BOtncf8ObCa4anphyzM/8HGeGFJA3gqmJbMtpyvqCsbu6gHyO+R5z32TJeyXTCIaw
	IrMoTES/W9Ub8Mb7HIh+RawT7epccYhWjxhT0WzWF0BuZ/kgdrHX0tDj/Nzd57gpgg4A7r6MZue
	WO9Vj/fJy/BIkGn/9dJMMx7xc/WXf4RmpBrJvkxFZsP9cTymDu6SgSH616uc0jGt0TQSa5Esemu
	8UtQ2C4nreq0yKOBoeioNmHr4YTbI8ZrvE9SI5GY5kChlAL0B5apNG25mygsXYfkf65I=
X-Received: by 2002:a05:6214:4f01:b0:894:9671:7aca with SMTP id 6a1803df08f44-8953c59c29fmr22939916d6.0.1770374848451;
        Fri, 06 Feb 2026 02:47:28 -0800 (PST)
X-Received: by 2002:a05:6214:4f01:b0:894:9671:7aca with SMTP id 6a1803df08f44-8953c59c29fmr22939676d6.0.1770374847992;
        Fri, 06 Feb 2026 02:47:27 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6598400f182sm430909a12.20.2026.02.06.02.47.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Feb 2026 02:47:26 -0800 (PST)
Message-ID: <1b78ea12-84ba-467e-b541-1ffd2348f38c@oss.qualcomm.com>
Date: Fri, 6 Feb 2026 11:47:24 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] phy: qcom: edp: Correct and clean up eDP/DP combo PHY
 configuration values
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260205-edp_phy-v1-0-231882bbf3f1@oss.qualcomm.com>
 <20260205-edp_phy-v1-1-231882bbf3f1@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260205-edp_phy-v1-1-231882bbf3f1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA2MDA3NCBTYWx0ZWRfXxgd7x4/YrfTk
 3HZgxGeBooe6L28NoJ+8c4gIFMBevH7JrSo6VQCrQHRS/c8Hf6vyAHCnSVizXdlDJr3k5qICMXn
 gKJ0oqJcqaPwfBgwuqL6eyNl1Mu/IedL5ML/E3a+QR3uzxkroacTykMNsvaeQD3qmtCsREFpyiW
 /om4Cm0Kg5em/nYkEuZN+6zUzdoy6QOW3vgv43s/sPdh/DKLLZ0nKF1uPGOZhGiqxLlnTZnIScU
 rEGppdkxH+AbFO3LpVheKBDD+yWWJduFj5UB4BNyr3QYFpvz02t3G15OT2byCGXOjLkErRfT4kd
 9p3UHxDsneDiEZYY3EshXg28/KiAQg78Ibr95OYj5wG+B54IRJmL6RwKgmmXeK24NYradX5fpDz
 E/cldKOcP/nhoTkuSiw3WE/SMLEGXpxh/wRrHvPSL8ToffKH74Q9O3b3xZ3ublkrFU/84n1b/xg
 8QupSdJe73k+lh1X/lA==
X-Authority-Analysis: v=2.4 cv=Wtom8Nfv c=1 sm=1 tr=0 ts=6985c6c1 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=5a8lAwskDaFuyyoYeSoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: tdXKlG2QqXRju2A-JvDwbTejI-XniCJH
X-Proofpoint-ORIG-GUID: tdXKlG2QqXRju2A-JvDwbTejI-XniCJH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-06_03,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 impostorscore=0 spamscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 clxscore=1015 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602060074
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-92016-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 83AA0FCCF1
X-Rspamd-Action: no action

On 2/5/26 10:20 AM, Yongxing Mou wrote:
> According to the current HPG settings, most eDP/DP combo PHYs can reuse the
> same configuration values.

Even across the various process nodes?

> DP mode：
> 	-sa8775p/sc7280/sc8280xp/x1e80100
> 	-glymur
> eDP mode(low vdiff):
> 	-glymur/sa8775p/sc8280xp/x1e80100
> 	-sc7280
> The current driver still keeps multiple versions of these tables and
> doesn't fully support every combo PHY mode. This patch removes the
> redundant configs and keeps only the sets we actually use, matching the
> platforms listed above.

I see that e.g. eDP Low-Vdiff swing setting for RBR is:

		hamoa	kodiak
arr[0][1]	0x11	0x12

It may be that this changed later during tuning but it's not reflected
in the docs for kodiak

Konrad

