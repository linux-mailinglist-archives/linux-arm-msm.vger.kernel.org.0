Return-Path: <linux-arm-msm+bounces-63831-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 831CFAFA11B
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Jul 2025 20:05:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E432E481F4D
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Jul 2025 18:04:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA07C20012B;
	Sat,  5 Jul 2025 18:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UjFY4ojF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16AB616CD33
	for <linux-arm-msm@vger.kernel.org>; Sat,  5 Jul 2025 18:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751738717; cv=none; b=qVutSPCswuftCmXkjwTrw3RFZVK6iOQZm7vnDhy7B0tOxFekewrHdqYlcDe8aEZpPvOqScT1pkAEa+JhWJ0a8eRnRryAYg4ed/5yYa04O5bDtIK9yIpk6i7NkR/bSA1ndQbBhouMQBLAHKe/7UuFzwkPXAAty/wxYusKx3fT0js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751738717; c=relaxed/simple;
	bh=XQVGIRJw3+xHjhRPG4C3JVHMVjLczj49kVy13S2Zu2g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YT+0Flqb/v6Zyzj+1grEYb4y8rXGOliDGt7V8fJjvrRcOeRgRgq+cSpb62m2JUGsCPMZBS5cAqP3XX+KI20oBkcB5IJqAtXZeZ/Da5Sm4LExMHgV3yau7sEcUfXx29naLQJfFUllxJiYsTy1cv7OEJWhcFY3PFIhIHOP+pD4ZFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UjFY4ojF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 565GdRun026958
	for <linux-arm-msm@vger.kernel.org>; Sat, 5 Jul 2025 18:05:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=V6PpfAkChLbMwzHqqroOnb6IX10ZpWIFhKKMDJenfD8=; b=Uj
	FY4ojF2Ye/5mhZp9iOid/+tD+pwhZVz6wxJ7h0gdl7rcImRU3ka3jIiSOea2/0OK
	2vz6zuVkPLaSN3TogUTjNqD9E+2kD/chZvWsvmAv9jEAInCf6OjqX8g5w9e2tt5T
	qvSxpfXp1KcIizeWrBoIpUY2rd4BWUBpwv90EOehUa2b35t+3eIHiE7XZJ7vCWo0
	FL7dowoggiAgwZe9JFCyOTBr+c6xa8gVoV8Cj1SEYEj9T2DcjHRB/+t2bJWsYQ2T
	Xiqr9cTS+ZNeNDsSWwzOROMcsyTp2fxUDKOpOCExl8soAvJH0xlV7OvLtO4cZ2kE
	b94PUM0kviELH2Dt0C/Q==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pw7q1ht1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 05 Jul 2025 18:05:09 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-40cf6614bceso1495884b6e.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 05 Jul 2025 11:05:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751738708; x=1752343508;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V6PpfAkChLbMwzHqqroOnb6IX10ZpWIFhKKMDJenfD8=;
        b=L51dyAk+5AG1FvAVIR3cwvzFb31BKEiZj4zgz0zwws0wpaUKDOLG/Dkzw8v7RnTKWx
         H6IayuWoK1zYjxcnKFEZ1VZaUNLoFPETclCQgX3kqOuxUwAiO+ExUA12Bbngy4WI5SQC
         vS4xQCi6/WhXE/Avg+6nkmW9QDlunVJnq1LkyUC/ytbmK7PQwG5cIdBXH6CsBa+SWLoU
         pKMc9pTrQKO+Gqsr71SBcgCAqX2fXRDPif4xwHdejzoKcc3XRsnOIACXCha7rQTBb40P
         lb3guQ7K/swsjJqPkTq0fYxbehxE+0qw45y9ZQaR7t5SnM7M0caNI+fcqwyCow3rgOWu
         Tk3w==
X-Forwarded-Encrypted: i=1; AJvYcCWBry/oiQwZzVD+DE6loArIrtiUDHslix5cQ8QPbJhHvVwQpvnZuizp9l4UprkRAVH+dv6xLJOKwxTpzgOY@vger.kernel.org
X-Gm-Message-State: AOJu0YxA/3DqaOQkyq42MOSJ+ZW1y0D9yuDCYD+af6EiEijLtOoSepMT
	IqnjB46LUOulcRgSPYK/UXZJiVDldf332mjF+BYS2t2qUPV9w4jqF85pZnZx5ccZIlbkg5SwFuJ
	1FcBrEdO06xGyJGda9Qcex2v7o55gQstBGxfDqu90Iycqu8u45FO5L6+FQQ2WJiyrRsisTzL1pk
	z78f+jpECodAEx10BHBeEo4NdD1TG/aQ0Zui5ALEbAzww=
X-Gm-Gg: ASbGnctDlHzm422dJ/zFlkvoYvERblqW3XE7YJFstf6VOeEn/uIso5r+YUmjnxlmMrL
	L0UNP99/8hKx2aibamrG20SnWWayJ9vs6tT8JSIWQEWDvnQQMkJpRx/wFseitDCGB4N0qloZ1JG
	GLFPCnOSYSa2X+1dXV751oI+5e1WefAQ7s7E8=
X-Received: by 2002:a05:6808:2227:b0:406:67dc:85e5 with SMTP id 5614622812f47-40d073ed168mr4931757b6e.32.1751738707914;
        Sat, 05 Jul 2025 11:05:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHA1V6eDhxgL68PhGByEGdZ2yGlPoePdjpJUerLbX2cT9JRZ/ymGxWYtpk/nq8tCGPhn0PxFjOVFmscNcrUN+8=
X-Received: by 2002:a05:6808:2227:b0:406:67dc:85e5 with SMTP id
 5614622812f47-40d073ed168mr4931737b6e.32.1751738707518; Sat, 05 Jul 2025
 11:05:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250705-iommu-fix-prr-v2-1-406fecc37cf8@oss.qualcomm.com>
In-Reply-To: <20250705-iommu-fix-prr-v2-1-406fecc37cf8@oss.qualcomm.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Sat, 5 Jul 2025 11:04:56 -0700
X-Gm-Features: Ac12FXxPGf3OtS1hFIiu8JcWUGDwoozM4YEfH5zfdc7rWndBMdlpthog4m8uuIE
Message-ID: <CACSVV03E5QZWuyiejY0BkecQbnLFYCOD2btW962XRJ+n4-KfWQ@mail.gmail.com>
Subject: Re: [PATCH v2] iommu/arm-smmu: disable PRR on SM8250
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Bibek Kumar Patro <quic_bibekkum@quicinc.com>, iommu@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA1MDExOSBTYWx0ZWRfX7HH5+rn9NqIm
 6i9Cy1XCoJe1Ssy8A7B/uo5oqszj/UsX/qqiJK45oOIzNsaio3CeTfZJ87hoHhwrkhyIKG9KuAT
 lmtflv8qx+n3QdylI3ljm49Ze3Ig5/PZlO8wcKyF8bXd+UjfK7NeuHJRG6r7gkP4PEROW7I85Rf
 QisJfsnFhcOvVQ/KeV+HPBjKAyTxC+Xwr9egV6WnMaJN8aFs5h1kVOGatjYUAFt3diXYZFpEtof
 /LzxAG913A1G42SboJmwy3bfuTm8hVHuR8SAxeyg0aVfWFfqRlNhqk2L1iX/wkEI99/aGNTC4tp
 mcs3o5b/FQNPhdDhf2cfn8tYD/N2428I+HPiREAONK6aCh6vGiCPTOYiYIPRzyCAec9I0yl6csH
 NcCsudz/jnyaBzrVy+a6YNOxMasH6/Lozih2t9y4dKYIcPVMkBEZ13Y0Fsd/7FhMsEKtApms
X-Proofpoint-GUID: oTfmkk9gOFhFObiKOTy59-3cBkz-uWwe
X-Proofpoint-ORIG-GUID: oTfmkk9gOFhFObiKOTy59-3cBkz-uWwe
X-Authority-Analysis: v=2.4 cv=SOBCVPvH c=1 sm=1 tr=0 ts=68696955 cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=2B00_WpXKG7Y0WWvpoAA:9 a=QEXdDO2ut3YA:10
 a=_Y9Zt4tPzoBS9L09Snn2:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 mlxlogscore=999 mlxscore=0 phishscore=0 malwarescore=0
 adultscore=0 suspectscore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507050119

On Sat, Jul 5, 2025 at 9:08=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On SM8250 / QRB5165-RB5 using PRR bits resets the device, most likely
> because of the hyp limitations. Disable PRR support on that platform.
>
> Fixes: 7f2ef1bfc758 ("iommu/arm-smmu: Add support for PRR bit setup")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Reviewed-by: Rob Clark <robin.clark@oss.qualcomm.com>

> ---
> I currently don't have access to other devices from these generations.
> It might be necessary to apply the same workaround to other platforms.
> ---
> Changes in v2:
> - Simplify the workaround as the issue seems to be limited to SM8250
>   only (Rob)
> - Link to v1: https://lore.kernel.org/r/20250705-iommu-fix-prr-v1-1-ef725=
033651c@oss.qualcomm.com
> ---
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/a=
rm/arm-smmu/arm-smmu-qcom.c
> index 62874b18f6459ad9a8b0542ab81c24e3e745c53d..53d88646476e9f193a6275d9c=
3ee3d084c215362 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> @@ -355,7 +355,8 @@ static int qcom_adreno_smmu_init_context(struct arm_s=
mmu_domain *smmu_domain,
>         priv->set_prr_addr =3D NULL;
>
>         if (of_device_is_compatible(np, "qcom,smmu-500") &&
> -                       of_device_is_compatible(np, "qcom,adreno-smmu")) =
{
> +           !of_device_is_compatible(np, "qcom,sm8250-smmu-500") &&
> +           of_device_is_compatible(np, "qcom,adreno-smmu")) {
>                 priv->set_prr_bit =3D qcom_adreno_smmu_set_prr_bit;
>                 priv->set_prr_addr =3D qcom_adreno_smmu_set_prr_addr;
>         }
>
> ---
> base-commit: 7244e36657076b597ac21d118be9c0b0f15fc622
> change-id: 20250705-iommu-fix-prr-600451b1d304
>
> Best regards,
> --
> With best wishes
> Dmitry
>

