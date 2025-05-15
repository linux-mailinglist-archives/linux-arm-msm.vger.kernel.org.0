Return-Path: <linux-arm-msm+bounces-58063-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B1DEAB87B7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 15:19:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8CAEF3AD0A0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 13:19:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DDC721348;
	Thu, 15 May 2025 13:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mrdd1QGl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 550784C6D
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 May 2025 13:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747315183; cv=none; b=SqdIpkOv67xolD/0+etIvbLTfKRp9Y5fbFbIVhM65sW3xKzMKemU/hiKn9SALXiOIzM/niTRkR1Jnn18HL3d/GWaW09wp6UFFtWxunc2Y1DUQfCjqoGGZyRxcYaHguCeU9rXS6+9CTCWJKl3N952Vl9bZ9X+dP0KjESLc8XGaDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747315183; c=relaxed/simple;
	bh=Zm9G2xwsKgxjJOV+s44pc/j48Bw+8HAAyt7i8aA5CFo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qcd0ajBbQQC2LT0of12CmTU2C05kAXk4NTrgXLdWs0edzrAmQrV23KaEx2ITpfLHfewKx2E4Hj7wSskTrAfvl2hwG18mQaGnA/uuAovuHDLzflsl4oplnTqAnlxr75mrc+j7Y8DM/Ek2pWl8w9SCdCdZLN+NXuQr/rkbDdpJLlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mrdd1QGl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54FDELW4026316
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 May 2025 13:19:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N9ZnOH3H7D9T5/jcmUmV/UrEQ7z2gjM/s4aRVI7E4pk=; b=mrdd1QGlH3nmNBIG
	urW5H4IpT4TLGnVcnFeUH61/QNb7SX4g4wLgSDtWGMu5hDLXH505aD+A3weKnbzZ
	iN5EUUKRfIqqNY827pgoBsdY60RszFWco8mEcKBzdmKXBPkAY4t+TaZ5YwKTNkho
	KYurG1J4VepnRPGW10zUegjnEIM9E/qIbJhw5KMxt+YOVO0fQqyBEBz0hoPbsYRe
	9qdclVsJDcH3vMSHYFP/LWtHcrox8xPpEYrIe2nt+Mb6iNPZdD1sOdwn1WhLPBys
	lR9KSTTv42pqaVZX+ZsSPlWIRnQ3QO1QP3Ai8c1M3EavIa7HCUHtMBpWpNE58E4i
	mgDWDA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcpebw5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 May 2025 13:19:34 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b26e120e300so383338a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 May 2025 06:19:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747315173; x=1747919973;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N9ZnOH3H7D9T5/jcmUmV/UrEQ7z2gjM/s4aRVI7E4pk=;
        b=p/oRxihHHrhix77rUKTQ2mPH67D9UQzKzmFUR3mN9BZFlVVf0MHHUzy1rQFjB5fbsy
         cL6BttNemVUw0SN6umLA471/BBCWmADuXB3tLQd95uBCoCCdMe05oxawtGAFSBCC6a5p
         uXzxVOuYRywrZ5zKXpd2hcmRabre2vOQFRbDP3jjW2o7vgQDq0Fehd9oNQgXkOpo8UoD
         IPA5Ne69Ud3b6eeDjx+tgg2sBj6z/4o3AYfeWpiheSs7oQgBKVxz8hc99K7b4BW6Ktzc
         FeEIEOkJ/HfSJURz2NeYNilJBHfnVH4Tuxsd4epZB/S1emqSFrVAm5ZaXEuMFouwJRmm
         J4Ew==
X-Forwarded-Encrypted: i=1; AJvYcCUsOCyX9hYnh2M+Pchlm1h9FOVYNSZVy9PswmLBgEavUcZLcMmNcNsLaF9tThEzxuWM1aW7c3YI/Nwr1VS1@vger.kernel.org
X-Gm-Message-State: AOJu0YzSfOWFovQ3ubOipmJ6iLPCXZkPeDUmfsP8s7osyynQwndLbq0c
	dUwY7FLWsGRYxWR4jw3h5OV3Xf0GDAgkA3uLpC4vvIWzIUVy018VWrlKp4YUopqGNcmKok3rV8N
	HrmgY3WCkcw9jJKc7wTJnOIPleBsJP7pvlj8+CQdagQOyXgyrt8AkHj+pa9vuh9UNUv1LFbTwxp
	iIPU8fI/eO/Y5J6jpG+l1rajFfFogJOVOo8ahR8MQ=
X-Gm-Gg: ASbGnctUC0Cvy1vYB8GoKx8tipX4wzCdA/g+PnnK+Y7UeOkW8upaqqXPvWJGVwIXYvt
	l1A30+x1bAgV4WLSTuDNEdS7QXjGq0gVQAx7omHnexqoBVlEzfBTf9IyAbQlk/MWuv5kMKA==
X-Received: by 2002:a17:90a:e188:b0:301:1c11:aa74 with SMTP id 98e67ed59e1d1-30e2e623b1cmr11402956a91.28.1747315173516;
        Thu, 15 May 2025 06:19:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHg3d7BDHmGBsWU5XublPLB/XPFKdVZJsCS3maA+2gokDf2UXAOsvoNFXdOBK9T9ttq9rS6Ga8UZDTSSIcvfmM=
X-Received: by 2002:a17:90a:e188:b0:301:1c11:aa74 with SMTP id
 98e67ed59e1d1-30e2e623b1cmr11402926a91.28.1747315173123; Thu, 15 May 2025
 06:19:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250509075029.3776419-1-quic_ziqichen@quicinc.com>
In-Reply-To: <20250509075029.3776419-1-quic_ziqichen@quicinc.com>
From: Loic Minier <loic.minier@oss.qualcomm.com>
Date: Thu, 15 May 2025 15:19:20 +0200
X-Gm-Features: AX0GCFuFBDmXAIIDwfx2Hc0T0HWQcGYYPE6n1w2SXKdLrh5wT3S981IyVtwjass
Message-ID: <CAAwKf-cBLTN_H-tOYu-k-4uBJB0qE=A2GE5LyH3frSV09eU91A@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] Bug fixes for UFS multi-frequency scaling on Qcom platform
To: Ziqi Chen <quic_ziqichen@quicinc.com>
Cc: quic_cang@quicinc.com, bvanassche@acm.org, mani@kernel.org,
        beanhuo@micron.com, avri.altman@wdc.com, junwoo80.lee@samsung.com,
        martin.petersen@oracle.com, quic_nguyenb@quicinc.com,
        quic_nitirawa@quicinc.com, quic_rampraka@quicinc.com,
        neil.armstrong@linaro.org, luca.weiss@fairphone.com,
        konrad.dybcio@oss.qualcomm.com, peter.wang@mediatek.com,
        linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: cr6cSPsTUrU-A3gQTH0PiJitboY9UEEM
X-Proofpoint-ORIG-GUID: cr6cSPsTUrU-A3gQTH0PiJitboY9UEEM
X-Authority-Analysis: v=2.4 cv=cO7gskeN c=1 sm=1 tr=0 ts=6825e9e6 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10
 a=VwQbUJbxAAAA:8 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=KKAkSRfTAAAA:8 a=thS5M9DFgM1jH-ShU_sA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22 a=Soq9LBFxuPC4vsCAQt-j:22 a=TjNXssC_j7lpFel5tvFf:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE1MDEzMSBTYWx0ZWRfX4ZhCKt936UVj
 4i3RAi5sZLIfAHsXpgk2Tc0NUBIpvpyyQnL/8yO4GHWnEEwSRH+9gs58veBFX3Cnzj9m6EsXmQ9
 PA0qv7OpbcrecOT7VrHl9dHZSfe+zpgbWnQlfn64nkTIpaqrOheNTY5/EkZ6KbtRXOBGwwXSzO7
 wv6w7aiGVmzWUqyp1BGCaz0Es96msWAC/Ch1RUPfKXGTI7lWeszeJQBlrd4NnwI6Pk177wCtD9d
 pwJYYkvKxFWnRT31HtRHmaM84a6C8GqUtVkbqaMXZPvvR0kA9DFOHIWG3QZV3cb6J7A7bwsEdZX
 W3MRTGOnHfWmQFvmkJubR8vP+IcxS70vGIB+PnBcWFWFFcx7pfthmrW4JovTIYoo204fWq+HFwo
 /fpfFK1FHWrbUUuTigyKKunt3AODXJpJhCF8G6RrnWHdZI1fFyZVfoLRkXo6HP6+ZsHGmxEL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-15_05,2025-05-14_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 spamscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 bulkscore=0 malwarescore=0 impostorscore=0 clxscore=1011
 priorityscore=1501 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505150131

Hi,

For all 3 patches of this v3:
Tested-By: Lo=C3=AFc Minier <loic.minier@oss.qualcomm.com>

On QCS6490 (RB3 Gen2) on top of 6.15-rc6 with defconfig.

Thanks!
- Lo=C3=AFc


On Fri, May 9, 2025 at 9:55=E2=80=AFAM Ziqi Chen <quic_ziqichen@quicinc.com=
> wrote:
>
> This series fixes a few corner cases introduced by multi-frequency scalin=
g feature
> on some old Qcom platforms design.
>
> 1. On some platforms, the frequency tables for unipro clock and the core =
clock are different,
>    which has led to errors when handling the unipro clock.
>
> 2. On some platforms, the maximum gear supported by the host may exceed t=
he maximum gear
>    supported by connected UFS device. Therefore, this should be taken int=
o account when
>    find mapped gear for frequency.
>
> This series has been tested on below platforms -
> sm8550 mtp + UFS3.1
> SM8650 MTP + UFS3.1
> QCS6490 BR3GEN2 + UFS2.2
>
> For change "scsi: ufs: qcom: Check gear against max gear in vop freq_to_g=
ear()"
> Reported-by: Neil Armstrong <neil.armstrong@linaro.org>
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on RB3GEN2
>
> For change "scsi: ufs: qcom: Map devfreq OPP freq to UniPro Core Clock fr=
eq"
>            "scsi: ufs: qcom: Call ufs_qcom_cfg_timers() in clock scaling =
path"
>
> Reported-by: Luca Weiss <luca.weiss@fairphone.com>
> Closes: https://lore.kernel.org/linux-arm-msm/D9FZ9U3AEXW4.1I12FX3YQ3JPW@=
fairphone.com/
> Tested-by: Luca Weiss <luca.weiss@fairphone.com> # sm7225-fairphone-fp4
>
>
> v1 - > v2:
> Change "scsi: ufs: qcom: Check gear against max gear in vop freq_to_gear(=
)":
> 1. Instead of return 'gear', return '0' directly if didn't find mapped ge=
ar
> 2. Derectly return min_t(gear,max_gear) instead assign to 'gear' then ret=
urn it.
>
> v2 - > v3:
> Change "scsi: ufs: qcom: Check gear against max gear in vop freq_to_gear(=
)":
>   Replace hard code '0' with enum 'UFS_HS_DONT_CHANGE'.
>
> Change "scsi: ufs: qcom: Map devfreq OPP freq to UniPro Core Clock freq"
> 1. Skip calling ufs_qcom_opp_freq_to_clk_freq() if freq is ULONG_MAX to a=
void useless error prints.
> 2. Correct indentation size to follow Linux kernel coding style.
>
> Change 'scsi: ufs: qcom: Call ufs_qcom_cfg_timers() in clock scaling path=
':
> Skip calling ufs_qcom_opp_freq_to_clk_freq() if freq is ULONG_MAX to avoi=
d useless prints.
>
>
> Can Guo (2):
>   scsi: ufs: qcom: Map devfreq OPP freq to UniPro Core Clock freq
>   scsi: ufs: qcom: Call ufs_qcom_cfg_timers() in clock scaling path
>
> Ziqi Chen (1):
>   scsi: ufs: qcom: Check gear against max gear in vop freq_to_gear()
>
>  drivers/ufs/host/ufs-qcom.c | 136 +++++++++++++++++++++++++++---------
>  1 file changed, 103 insertions(+), 33 deletions(-)
>
> --
> 2.34.1
>
>

