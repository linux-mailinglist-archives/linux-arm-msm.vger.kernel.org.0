Return-Path: <linux-arm-msm+bounces-101396-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ALxuINOLzWlfewYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101396-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 23:19:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EB093808DC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 23:19:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7762630193AF
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Apr 2026 21:19:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48653378D7F;
	Wed,  1 Apr 2026 21:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HG6A0XHg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hDhOfGDj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEA9F313E34
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Apr 2026 21:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775078350; cv=none; b=saKG1f0xh9Z2QCI9bia7g2ioCB9/Jg62frw14sZNPaHMmQAGUK+HJuchBER8CPuyWpCe8zfn3AtZk1AeWQiuEzDHIXLwr6OoN5q3+cpDccHgof+QwiWX+4VCYmbgNWO495EhLjRS0tsvJWE7dR1RcmADibvotb09qt0/3lYSolE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775078350; c=relaxed/simple;
	bh=fEaf7QvQ7wRx+uSbM3zknmsCAP/jjVCTwNsQ4h7pPDA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kmogMJbF3Y1Zsk9UQBSSP/H2FlGCwf5mbS1FKQsZ4k4GttQOGEH7cbd9a5gp5gkO4NSJ3q8/0aFPz4fsxbspJ5RdAUkiB8GKQjrINLMNq7/EJlzw7zHvMM/nSx7pG/FlrP7hjY84nUTzp4qyhzLzF7z03LYjdNZyC0bEmM08zEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HG6A0XHg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hDhOfGDj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 631J6l3O752012
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Apr 2026 21:19:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MFIuY4/3MQgVWulfNuG870ap3FwBWrkYASAoWuf76ww=; b=HG6A0XHgM4NikeWw
	iuQ4XvQ/3a2P3x1LZcqrAKSUezJhEAH4I3qnlwSeX924GFzDH9XVZiBSyKJg7hOc
	6t+47w1hJXPxqtN6QPksN5ErCpENlVZ9YkxPwk82hHPMGDk+K+9zaJ3HlPGX0XCY
	ZMD4ggJ1YIxSyKQ7cypdcYMMF/Vz+PQpzrFED2CCNWUzc/EjWuYh8ssFWVWg9DVo
	oEJVKezHZOUl49KssKIVDmjTfPqtf+6jWG0A2BlOZ596OslQsxqaDtRSfCm+A1vX
	9CrDqpK6Y6vKOuVfYR0wC7OFCQBc6kgxt8pA9erR8vjTWqP4RoHoVS4BE2X5bVrm
	PJctWQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d96k9916f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 21:19:07 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82c714cb672so96556b3a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 14:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775078346; x=1775683146; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MFIuY4/3MQgVWulfNuG870ap3FwBWrkYASAoWuf76ww=;
        b=hDhOfGDj1d/PqzNvHqJiq2qmoRgv3GF6v5H1HY8EMLOc/1Vnf0EyfpD55whEullIvb
         JvExKxDP/isT8X+y6GvbPfcW9cPOiPxQ/A5tiPN93cg+mzLm7PnMc6Ang+/E4/UugOUs
         iivn/nDZldrTM4JEJVbVWGBllOKAOGDFKFJKRUWrTYK1DBSPoZ6kBaEK2ay+V9M8CvH9
         y3YLL/6wI8QMxLDcMrcftBpmfawnKJTCk/Mwh7HmdEwf0Lg3KtS07jz4KBfcnAK0954h
         YLudOlsd40mJSm2mZujdXNkOKayu77nGyVGolFyNaOeKmp9wGRVv5VPgoOSK2JOO5rmh
         3LpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775078346; x=1775683146;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MFIuY4/3MQgVWulfNuG870ap3FwBWrkYASAoWuf76ww=;
        b=NBalb1e4vXTZ0pwjTljp0hVJaIo2wYR6+5Ha5x2PcGygr4nch93g8X510rIBbSDpw4
         7hte2zFfaEG7GFJI7bCxJbmfQgXJLmZ9FxkbJJsVmasQbqflknlJWL6pDjpOseyK/RV/
         ++2m9BPy6qnrOjWmjY1IEHmrABOBsuDIte2RSGO2akimJcTUcuDlBJNjX+a55FzHEaMR
         dlmNOmMH9yquzgbJNfGQVpECwYhppDmHClnAywAWrFJNU1J9dv3xnbocVAWuuUcNx5y2
         PPApwZzrrbfaZO5ELTMakH97ZKrxx+myFnLHdoYGIHySWndnREQKG9tgubXUyhw72vr4
         GVmQ==
X-Forwarded-Encrypted: i=1; AJvYcCXrRyS75sGt5osYlQjfdvIxD5sRT0PEvlIZSS0InG0E7jvhSLSPR2xzVUkYdn35v1GLJaDpkhWlErMOeNq7@vger.kernel.org
X-Gm-Message-State: AOJu0YyQP85laQrEjkl7DwsPaXEQSncazEU6GFPE7FGyqYIKkf8jLmui
	ZtESp7vUoXH97qF8mcMxzu2VGMF5Th5V9zKyZI6RWCc2GeLpXQI2fygyKxyTHUxZmo3RiglBB+A
	q4SXXCVHSa3SZ0utaMxizxfjFqF1HSQ3HYiYgjWpERqUso2EYDm6pWzdQ1bLrs+DjuLJk
X-Gm-Gg: ATEYQzxvtDMLgjtgaB9ErVYPfWwA6D0nzo/LeAtm3BTZKWp/PCB3tb5StL5x9J+kJJe
	eftPlh0D2+Vs7bkRw7xSavr7tVrqezclhNyba7qk97gYyrt8q8JlWXgbFoiTBl+E1TE3CksrHkS
	eE753tcz4C/7bcaJcIxyGAPQNC/4HcFlnCQrmpIywL0hGW+jp5uX8M4h2KcWz7TAUP+vzghssYJ
	cE+whv4PbIAbdLt7J/dS+e2agIiyI13pEQ584YahbMNRXFYAkAWKqv6Gdlb2KO4zO9zXTj+3vyP
	n0hJG+X5L4U0DTIsSmzfJ+KL1Homx2r4YvtTnCcG32YmBW1grP0rVRtzpJjmFUB8Xh9ZweLmDb4
	WPbyZUuSERya2D26CkGrSZO2ZqVBealdKTXq5NVq/aSWHFg==
X-Received: by 2002:a05:6a00:2d98:b0:829:8942:2ca4 with SMTP id d2e1a72fcca58-82ce890ea64mr4893847b3a.19.1775078346176;
        Wed, 01 Apr 2026 14:19:06 -0700 (PDT)
X-Received: by 2002:a05:6a00:2d98:b0:829:8942:2ca4 with SMTP id d2e1a72fcca58-82ce890ea64mr4893811b3a.19.1775078345645;
        Wed, 01 Apr 2026 14:19:05 -0700 (PDT)
Received: from [192.168.1.9] ([106.222.231.116])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9c41b8dsm776662b3a.34.2026.04.01.14.18.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2026 14:19:05 -0700 (PDT)
Message-ID: <6a3eb07c-4771-4e4c-a4eb-9bdab874c0ad@oss.qualcomm.com>
Date: Thu, 2 Apr 2026 02:48:55 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 0/4] Support for Adreno 612 GPU - Respin
To: Bjorn Andersson <andersson@kernel.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Qingqing Zhou <quic_qqzhou@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Jie Zhang <quic_jiezh@quicinc.com>,
        Rob Clark
 <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
References: <20260312-qcs615-spin-2-v8-0-fca38edcd6e6@oss.qualcomm.com>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260312-qcs615-spin-2-v8-0-fca38edcd6e6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=doLWylg4 c=1 sm=1 tr=0 ts=69cd8bcb cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=YUf46QchBRIYdusOZX0V1g==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=kFibZDKCZPP84u6MAsYA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: Nm1LL_PITC_rbXWe9u_4x3L6HjZLKNgm
X-Proofpoint-GUID: Nm1LL_PITC_rbXWe9u_4x3L6HjZLKNgm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDIwMCBTYWx0ZWRfX9DV2O8IUdTqx
 GUcSN0/udZYuSt/Kj1GMLVVFAq8EVNWh4lKTgwMT5s9wQBg2nNGkCeL61XjeKg6xztv2dbKZir0
 OeU6nXLT2M+W2l/fnWJqS+2QIRldjJ+Mz+keN2ikPtbJF4Z1WxPJG7OH3/ZVoB/vIuDWWcnjYft
 +LdJeNTWRyGpzeQ4zmhXGGqjS5wU/xji3GlkIYS70PQT8ufczTekiPnZvov0zs6EXHbC3lTIM+4
 jBG0s3uyAVMescvTAJTM+byGh7ESpUYPSanIXU7Cmjfgt9tDByvXnpLTmFCGsMSBM+lRDPK7nk+
 1KBVsha19s2Fnu8/liScvVCgmVHzU7eFjEopS8QC/mIDnsR6JM83wraKzRspKWRJIANv7x0f5Fv
 zUKWzyJfhplLpvkcKBF7UIj2tQrU/Q6WqvT53lbTnLXjjR92KFw0p7yLxFMzn2nLy+AnpqylrWy
 yeFUhNT9lS9r5DEl/gw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_04,2026-04-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 impostorscore=0 spamscore=0 suspectscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604010200
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linaro.org,vger.kernel.org,lists.freedesktop.org,oss.qualcomm.com,quicinc.com,poorly.run,kernel.org,linux.dev,somainline.org,gmail.com,ffwll.ch,linux.intel.com,suse.de];
	TAGGED_FROM(0.00)[bounces-101396-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7EB093808DC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/12/2026 4:39 AM, Akhil P Oommen wrote:
> This is a respin of an old series [1] that aimed to add support for
> Adreno 612 GPU found in SM6150/QCS615 chipsets. In this version, we
> have consolidated the previously separate series for DT and driver
> support, along with some significant rework.
> 
> Regarding A612 GPU, it falls under ADRENO_6XX_GEN1 family and is a cut
> down version of A615 GPU. A612 has a new IP called Reduced Graphics
> Management Unit or RGMU, a small state machine which helps to toggle
> GX GDSC (connected to CX rail) to implement the IFPC feature. Unlike a
> full-fledged GMU, the RGMU does not support features such as clock
> control, resource voting via RPMh, HFI etc. Therefore, we require linux
> clock driver support similar to gmu-wrapper implementations to control
> gpu core clock and GX GDSC.
> 
> In this series, the description of RGMU hardware in devicetree is more
> complete than in previous version. However, the RGMU core is not
> initialized from the driver as there is currently no need for it. We do
> perform a dummy load of RGMU firmware (now available in linux-firmware)
> to ensure that enabling RGMU core in the future won't break backward
> compatibility for users.
> 
> Bjorn, I have rebased the pending DT patches on top of arm64-for-7.1
> branch to make it convenient for you to pick them.

Hi Bjorn, Gentle reminder to pick up the last few pending dt patches in
this series for v7.1.

-Akhil

> 
> [1] Driver: https://lore.kernel.org/lkml/20241213-a612-gpu-support-v3-1-0e9b25570a69@quicinc.com/
>     Devicetree: https://lore.kernel.org/lkml/fu4rayftf3i4arf6l6bzqyzsctomglhpiniljkeuj74ftvzlpo@vklca2giwjlw/
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
> Changes in v8:
> - Rebased on top of arm64-for-7.1
> - Link to v7: https://lore.kernel.org/r/20260121-qcs615-spin-2-v7-0-52419b263e92@oss.qualcomm.com
> 
> Changes in v7:
> - Drop msm driver and dt binding doc patches as they got picked up by Rob Clark
> - Update interrupt property to use 4 cells
> - Rebase on top of arm64-for-6.20 branch in Bjorn's tree
> - Capture trailers
> - Link to v6: https://lore.kernel.org/r/20251231-qcs615-spin-2-v6-0-da87debf6883@oss.qualcomm.com
> 
> Changes in v6:
> - Move the rgmu register range update from patch#8 to patch#6.
> - Capture trailers
> - Link to v5: https://lore.kernel.org/r/20251226-qcs615-spin-2-v5-0-354d86460ccb@oss.qualcomm.com
> 
> Changes in v5:
> - Rebase on v6.19-rc2
> - Make the reg list in A612 GPU's binding doc stricter (Krzysztof)
> - Link to v4: https://lore.kernel.org/r/20251204-qcs615-spin-2-v4-0-f5a00c5b663f@oss.qualcomm.com
> 
> Changes in v4:
> - Rebased on top of next-20251204 tag
> - Added a new patch to simplify gpu dt schema (Krzysztof)
> - Added a new patch for GPU cooling support (Gaurav)
> - Updated the gpu/gmu register range in DT to be more accurate
> - Remove 290Mhz corner for GPU as that is not present in downstream
> - Link to v3: https://lore.kernel.org/r/20251122-qcs615-spin-2-v3-0-9f4d4c87f51d@oss.qualcomm.com
> 
> Changes in v3:
> - Rebased on top of next-20251121 tag
> - Drop a612 driver support patch as it got picked up
> - Rename rgmu.yaml -> qcom,adreno-rgmu.yaml (Krzysztof)
> - Remove reg-names property for rgmu node (Krzysztof)
> - Use 'gmu' instead of 'rgmu' as node name (Krzysztof)
> - Describe cx_mem and cx_dgc register ranges (Krzysztof)
> - A new patch to retrieve gmu core reg resource by id
> - Link to v2: https://lore.kernel.org/r/20251107-qcs615-spin-2-v2-0-a2d7c4fbf6e6@oss.qualcomm.com
> 
> Changes in v2:
> - Rebased on next-20251105
> - Fix hwcg configuration (Dan)
> - Reuse a few gmu-wrapper routines (Konrad)
> - Split out rgmu dt schema (Krzysztof/Dmitry)
> - Fixes for GPU dt binding doc (Krzysztof)
> - Removed VDD_CX from rgmu dt node. Will post a separate series to
> address the gpucc changes (Konrad)
> - Fix the reg range size for adreno smmu node and reorder the properties (Konrad)
> - Link to v1: https://lore.kernel.org/r/20251017-qcs615-spin-2-v1-0-0baa44f80905@oss.qualcomm.com
> 
> ---
> Gaurav Kohli (1):
>       arm64: dts: qcom: talos: Add GPU cooling
> 
> Jie Zhang (2):
>       arm64: dts: qcom: talos: Add gpu and rgmu nodes
>       arm64: dts: qcom: qcs615-ride: Enable Adreno 612 GPU
> 
> Qingqing Zhou (1):
>       arm64: dts: qcom: talos: add the GPU SMMU node
> 
>  arch/arm64/boot/dts/qcom/qcs615-ride.dts |   8 ++
>  arch/arm64/boot/dts/qcom/talos.dtsi      | 149 +++++++++++++++++++++++++++++++
>  2 files changed, 157 insertions(+)
> ---
> base-commit: bb4d28e377cf04fbee8a01322059fa14808cdfe9
> change-id: 20251015-qcs615-spin-2-ed45b0deb998
> 
> Best regards,


