Return-Path: <linux-arm-msm+bounces-109741-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gNqqCW9OFWpMUQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109741-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 09:40:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EBCE5D1CBB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 09:40:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0BC9A3010C2B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 07:40:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7C8F3CBE86;
	Tue, 26 May 2026 07:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WRgWDnKQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bfzVroaA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C5EB3CB918
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 07:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779781227; cv=none; b=Dm3azepTea0FdA27pClIyDdP6ciw7KdwY27aDIQPIsKBImOGirwYQWf++UdAfiQgXyelE0i2FS3zPBBavQ4B0wLyqAU5+GBpMifZibqQ9tnTPZbvi1QgWd6MXAwnM6wdy2i47aFVIClZsVyzGIoCwlC29D9nqjHofjsz1sonoRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779781227; c=relaxed/simple;
	bh=wkYHgE1zQioQdA22lstlI+PzjaWJbeDwxHaiVIjncUI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BjNugc76lveHBVS/Gvtau70v5S2YKMvG5v/yMixJLdmtYId3DALbS1SSOkHckNWHZCAhCeMjTO1VxIILU8xApC0u6d4fst+sE3ceoyEFqzLfhhULiTZZud+MTtSToFg7mz2qE4yQCVubP9u+1JP4p96AaUKk5dljHZIgvlqOLRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WRgWDnKQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bfzVroaA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64Q4P1Kb005001
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 07:40:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Z1lH9qHc9cUGrAmymdHhxBXYrU/XEbuaTeWZQzODhAU=; b=WRgWDnKQigeRchOr
	oVNiYJ+7bZQva/JaKwuw7y912rx9BVI6cVu5H7I72JVeO6crD0Edrwmy5p/PPHVA
	fpbhX8sgiNw8f12qfDLNF3qmtkVSs+zNmgkQdlOWFwteBsoCsytZzjsCiCdFwCwu
	sTqQnvYxkK+WmSH0VZuFZ4C/nIfTYbDh9bHIus1U/A3+2bF92f+Tdjze19x0FUYE
	nCHtsA4bEyOePe9abMtzEID5DE356ONaUYMBbb4zt/wekVIe9UYu8lPjRW/JldVL
	Q66zfg+2mvIwzxUORADDyb80QgmzNkLaMCU2yFW6GaLgmDArxnsjMiMw6/Lex33d
	xoucXA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecsm02a9r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 07:40:25 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-366ded5ab5fso20073108a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 00:40:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779781225; x=1780386025; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Z1lH9qHc9cUGrAmymdHhxBXYrU/XEbuaTeWZQzODhAU=;
        b=bfzVroaAZGJniG5t2n9fV7j+TiQ6QizD3bbDAj+K+Jv3JUnFB3ho+fK6RcWn64RU9q
         qokDbz2WooSp7fNuZtWuxyY+Fj9TnV8cOW6oYW2QVqOPBlEZGHsPAhEPPni0EGMKuW6u
         wX7BXcdxhOjYWBKoZZELQOFwzrd0+EbsGAAbIITu3EJZeEKtqPSHd0jAYI2hdfDMqeGh
         p4XHu2qbiZNiqv/54my/1BCAo6HGsd5PI/TLe5F4VCWk5ox1m5ZkwKPMlFaZOn9EYEzT
         6N1lCRGTgAChtzqDYeDuW4HLJ+XveHsrNzvNEkUN+b6txQHku1o/dxUqMXn4gs2xiOzT
         qFIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779781225; x=1780386025;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z1lH9qHc9cUGrAmymdHhxBXYrU/XEbuaTeWZQzODhAU=;
        b=bts+B16k6lzzQZ1ojlIjtiZgIkVG0FDrcWxmi7hldk47Rb58zgzFzMhkzWMDVQ+kaZ
         3PuA5ZS4sMTDGs3dQx+Js0yW2KwP5hXY4gOAIamoNV/nJEk9+tuxYH410On57g/kqKte
         WTcczQ9VlrTrZeiruRsgwitGPi0NOROxeku4rD0Ns1tLB3HKxbqGhVWZeup5BtfgL4gp
         mEcNdcHkc6cPhJTtl4XhIaeiJyse/w58Vsp8TdL5I8Dm1cZ3yq8DeLZmWzTSDNdGH41r
         mLWHrov4RNfyAZdNCx2qWNrjJJfO3tohUnnTj833dfCGTcCknLcDkLsxbcNuRb0L+H0x
         vcig==
X-Forwarded-Encrypted: i=1; AFNElJ+CohY+F/sKcUKrz086LmLl/K/ifWXZysS8m5ultKtk5Coz/eWQL3U0G4Mesz3ao11Y/KrSqZkVDtv4yysE@vger.kernel.org
X-Gm-Message-State: AOJu0Yxn01g7oOxqXEyCFGQJN+WnQmiPdCfqLs8Sgsyy7riGFOT4qJIt
	CCMVfQ9WhRLqSbN7HU8fW19U+unMhDHYmrxmOLDmORpoDk2uTHtEP96nRO7IJb2fsViQnWvwr5F
	9NfJJA8un+Dl4mMND1pSpn+Xa9HciT0XwEcCrlhtGqEwhrcNqcugwcuDkM/f0ZDEatWEw
X-Gm-Gg: Acq92OEuhVYkJ3injzkCWUn4dcHR2Bgql1BF+yUg0qUhwGUFkbmXh7UkkyuHlYkK84D
	4c6hk84oyI2LQ2xrifq7l2hHqntlrHp7GzuF7TB0s9N1zS++6DU3ybv1xpZOYqmXtv+8yHD7mht
	TfEoEDJB3Sf8EnxfvM+vKp3SNGH6wex3BCbkTDyMv69XpHw4HIBmeLH88Cb5xA3SObHk8GCl7mG
	xJ45pgcVQ3usjeD18Po/B+JnZKPHuE8/tGQHCZghFYJNZEmug1lqPYbrNo5C/ZRbsUffzR3h/tK
	1uy5JKJAbQK0FxhlCKORprlxVtiRco4KJXOeLG0X1jfowvHwCa0FKgto3JoBnGdxVxs2fc4wK36
	PXBh9cRtd6zXIAujnpiVEn84F+p8hAdybMnSvhE7+omU6UrlDfccvlWcH9rrry656WM6EMrqE4z
	Y8qI55Tk/EfD4hMXo=
X-Received: by 2002:a17:90b:3582:b0:36a:e839:4f95 with SMTP id 98e67ed59e1d1-36ae83961acmr3714844a91.11.1779781225142;
        Tue, 26 May 2026 00:40:25 -0700 (PDT)
X-Received: by 2002:a17:90b:3582:b0:36a:e839:4f95 with SMTP id 98e67ed59e1d1-36ae83961acmr3714826a91.11.1779781224669;
        Tue, 26 May 2026 00:40:24 -0700 (PDT)
Received: from [10.133.33.226] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a721c7baasm14816010a91.9.2026.05.26.00.40.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 May 2026 00:40:24 -0700 (PDT)
Message-ID: <f4f036ac-b150-4bf1-8b4a-b83641fc42cd@oss.qualcomm.com>
Date: Tue, 26 May 2026 15:40:18 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] spmi: pmic-arb: Add spmi-pmic-arb support for
 Qualcomm Hawi SoC
To: Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        David Collins <david.collins@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, kernel@oss.qualcomm.com
References: <20260419-hawi-spmi-v3-0-b04ee909cb87@oss.qualcomm.com>
Content-Language: en-US
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
In-Reply-To: <20260419-hawi-spmi-v3-0-b04ee909cb87@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=CLEamxrD c=1 sm=1 tr=0 ts=6a154e69 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=QCjGO55T7APnlLQUJ_AA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: -HwWonHv5NhrKX0RTip39zvxftyb6Hyw
X-Proofpoint-ORIG-GUID: -HwWonHv5NhrKX0RTip39zvxftyb6Hyw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDA2NCBTYWx0ZWRfX8KhLxKX22ocP
 0zeQWj3ZNl/+Twa3l9M8zbIKcaLKNN/ASMJ8XPzR19ZatVDQkMX6lGlKICBMet39AZ/6NdDa9I8
 1pFitIUYvHWJivtA6ESMFUprF+vpARP9S+jxdm7MXERLYAAHresJbcqPb1i8cL0mfbR0CYkyyau
 c7hqlHrR4uMJNh634BzpOuHDfq6q5ww3d2jXcMOdW894E2LgDv2vz7TDF/kykaPYkxHiFvt4tdY
 H5MZN3FD/smX4AlehGizNn9Tnps2Ndm5r3AeyfYbTYISdNS7xHxT8MtAF3uqb4YOxMzEuOqpore
 pKr1XyK3R9GrNwq0XYWUb7+SfpF9AjoloSiKBSsfHXbVXkjHGJ8vA9tXtsGS9HELL9t21YI05gQ
 yChD18Fm7rcNpuzVnk7w27U/mDCeZ0Lv35F0kd8xDYddinFXIT7ddc0TXr7wjOPo6MK/ILqyCyf
 pHs/oHYDiUqOlCtVA0g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-26_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 impostorscore=0 malwarescore=0 phishscore=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260064
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-109741-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fenglin.wu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7EBCE5D1CBB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 4/20/2026 10:25 AM, Fenglin Wu wrote:
> Add compatible for Hawi SoC and add pmic-arb v8.5 support.
>
> Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
> ---
> Changes in v3:
> - Updated the driver to include a "*check_chnl_status" hook function in
>    "pmic_arb_ver_ops," with separate implementations for each version,
>    as per Dmitry's feedback.
> - Remove the Reviewed-by tag.
> - Link to v2: https://patch.msgid.link/20260402-hawi-spmi-v2-0-0bbe811fe3f4@oss.qualcomm.com
>
> Changes in v2:
> - Revise patch 1 commit text to highlight the new features of the
>    PMIC arbiter in the Hawi SoC, and clarify how it is compatible
>    within the Glymur SoC.
> - Link to v1: https://patch.msgid.link/20260401-hawi-spmi-v1-0-c40963041078@oss.qualcomm.com
>
> ---
> Fenglin Wu (2):
>        dt-bindings: spmi: glymur-spmi-pmic-arb: Add compatible for Qualcomm Hawi SoC
>        spmi: spmi-pmic-arb: add support for PMIC arbiter v8.5
>
>   .../bindings/spmi/qcom,glymur-spmi-pmic-arb.yaml   |   1 +
>   drivers/spmi/spmi-pmic-arb.c                       | 142 ++++++++++++++++-----
>   2 files changed, 113 insertions(+), 30 deletions(-)
> ---
> base-commit: 840b0dd6b8c169e963f74265f508c54f1fe3c968
> change-id: 20260323-hawi-spmi-a29ef97409a4

Hi Stephen,

have you had a chance to review the changes and are you planning to pick 
them?

Fenglin Wu

> Best regards,
> --
> Fenglin Wu <fenglin.wu@oss.qualcomm.com>
>

