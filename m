Return-Path: <linux-arm-msm+bounces-66446-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D8A09B104E1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 10:53:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 394C45A3056
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 08:52:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA7AF274B49;
	Thu, 24 Jul 2025 08:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EcsQUE6o"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 383BD2750F9
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 08:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753346515; cv=none; b=AU034NQg9kgg6tH0KWqH6ZTUwcQLWRslUGx4bwh8tFEITxYtmLmhbOIOZYDewzvbD0yLQikwcKAiBxIAJLGTfyb5RupVX+BZIUX1kXHUe80BUlKA1SLpVRQAUG5XlG1tBDiJfLz4rPBwuPo5nf0B+09NTFzBj5nvXCDJxM3yUAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753346515; c=relaxed/simple;
	bh=rnF+oib9L2Skeeylwk63DB1XU4v0B5lhktdPZQZmpLE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cuUCl6cl9YDFap5fJ9v31AJuJEXBQmRL2uwHQ4HIIkCq7QgIVs1Lm3zBntFNBObmJCV0BKVT3TvxHk8k9o5HKOT6QeykVfCSjlC408l+pVWF5Lx3OIqZKC+sQxxlmfOmEQdCxXmHMdodANRSSPjBJiU4Oju/xRYfH/RrucS41Cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EcsQUE6o; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56NMXMSG010365
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 08:41:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NcSQxl+jVI7Me55KCzMwMtBdepNG4E+Ro3RKSYD+KgE=; b=EcsQUE6oQbOB6gV6
	fW/e8YgGlrgDCPe8iUIYyzlH1uzn9SPmPUnU+2ZfPKsBW6tH/Ck9pAdfr2SipWGI
	gnTv2/ZWNtn+tLNtKoYxPtE6JxXssP9L8/dSb9jGG3/8x5j5zQlAN/5odq9Er/Rx
	zMRa1rAYymBg7RREKjyl+ovZLSChN5CHnMQW843I4B/Z1etqA2DbAEHgrhM54sCv
	4bcgBT+Sq45J0Gqh6tAxnzz49whXpnbEWATBkH6ME4EjmlmsdQcFo1GR3pOubVLF
	fq6DjTVR3fugEK1hc0j4RPdQK3F1aNuPaw59RKl82uoGm0QJJi6CdqirS4ZjwAUA
	PtF60g==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 481t6w96tg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 08:41:53 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2355651d204so7690135ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 01:41:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753346512; x=1753951312;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NcSQxl+jVI7Me55KCzMwMtBdepNG4E+Ro3RKSYD+KgE=;
        b=pMWOG59YQSDSHTFtBJPAZSLsW+GpVNgzPccSaxolkE/U3pZdz7/Cx8cEd1+cmyjFxf
         XookLweX7i20L2jp/EoHydaKYT04lC9mjQmP0fUQQOHJpPt9jx8dNeL4x+O9s2t8pSKA
         ohjfTaVhcR1fUQYcWFrU+uQmvGY35Cvs/2aCgRJfnMK+OWsCb8ZBOq/gUgxyUG2B3pDY
         RvMfZn4v5zP8z1mZ5DN0MsX89w+5McUT2L/0FO/FiW7scHBC4u8CC5K5fdFqiTVnzOWu
         VzDXwmYqzZRiqu+OCwiBDiRedYRw6/TIythkgw3ePeO0+uexZkUk8xHyeIBZ9xZP6oWd
         pLKw==
X-Forwarded-Encrypted: i=1; AJvYcCUuznijdc3j9LR8HlbBFJf4ISD5u1t2SV7I0Q04LBMhjBwZ2JaZ6euvSPweNr71dVrR1kn1gL7xXiaoc4Ky@vger.kernel.org
X-Gm-Message-State: AOJu0YyFWMu+HjhyfgksSN96neLOvs2/O5AROaA+6cOWfVISvyN5j9Wm
	UbRvIq41jPtA/Cap/MwVQxYCn5b3qaUFrlvvtHWLqbAAETAbbdJ4Zbl3tSOCBGFcY415Wtr5FiI
	q7084ryKXbFQFmkqHYy22LSqrtrE3oMQP+KFcSnC8IhJt8TWwBqbh+3iGQxEEP0nCWOUYOOPDQm
	CnKl2kivyumG1B3eu8HU8qP0QS3QGGOneDo9OGBcQXUD8=
X-Gm-Gg: ASbGncuVW3Ksmm196+t+V1KEToF7Nsu/rN7H1s5gfyMjgDosjwHpeGvUypNeqvyHux/
	KmF3/NXChYosNtI1LEEZfN6Sxim71Jgp+VGvixj8AegrAGWrflA1/lRuWHB+7SG6PqU9xsVZZ7v
	0eMmEPwrPj1HjdfxRMZH3I7orW+GrviIkTt0E=
X-Received: by 2002:a17:903:40ce:b0:234:ef42:5d6d with SMTP id d9443c01a7336-23f98160d78mr85101315ad.23.1753346512449;
        Thu, 24 Jul 2025 01:41:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFSyCdU8c5GLoMY06XIHDleMAFGJhzG6lduNlXjRkOM6bAsMFhgLYqcBatDA4hvNaRMBi5/zQqFRDpuPCkf3pg=
X-Received: by 2002:a17:903:40ce:b0:234:ef42:5d6d with SMTP id
 d9443c01a7336-23f98160d78mr85100995ad.23.1753346512006; Thu, 24 Jul 2025
 01:41:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250722161103.3938-1-quic_rdwivedi@quicinc.com>
 <20250722161103.3938-2-quic_rdwivedi@quicinc.com> <2ihbf52nryduic5vzlqdldzgx2fe4zidt4hzcugurqsuosiawq@qs66zxptpmqf>
 <f61ac7b6-5e63-49cb-b051-a749037e0c8b@quicinc.com>
In-Reply-To: <f61ac7b6-5e63-49cb-b051-a749037e0c8b@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 24 Jul 2025 11:41:40 +0300
X-Gm-Features: Ac12FXzMKMuF_0OUA3EGJwZLmjVM8hRhGRUkVzF5il0fHysdmUBOWLdVHSEcSgQ
Message-ID: <CAO9ioeWLLW1UgJfByBAXp9-v81AqmRV9Acs5Eae9k4Gkr1U0MA@mail.gmail.com>
Subject: Re: [PATCH 1/3] ufs: ufs-qcom: Add support for DT-based gear and rate limiting
To: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
Cc: mani@kernel.org, alim.akhtar@samsung.com, avri.altman@wdc.com,
        bvanassche@acm.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        James.Bottomley@hansenpartnership.com, martin.petersen@oracle.com,
        agross@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-scsi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=SPpCVPvH c=1 sm=1 tr=0 ts=6881f1d1 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10
 a=COk6AnOGAAAA:8 a=kyiDCW8mUpRo50OuNtQA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI0MDA2MiBTYWx0ZWRfXxRRcyWLG55Wg
 wyVqY3ykXbuUuECcpJkIzEqrgpfF/nFVmL4pbhNBLwE94LUogX7tXIeZMVyq5V3pI1G8NJ7yF4Z
 zVmsahlG9aDLN4G5Nyk/9htArf52UUqPsjoAWkRemjSFweDLKEXHdH5haw5V4n/XTisxQ6Hrq/t
 lrZgiNzOMq2F22xSXK68NHfloDsskVQOIW9CC8EQSOc2/AFcOwFsV3USvZhR288cob4PkiLqUL7
 IxFrV97ZfxNyvi5IXckfytAFAVBUxRCzmT1rg83u9osex5icbh/4OBv5cqRQO1n4z/bfg/v5gi6
 FlNwBlrCUoxTIUQ17u6sA7a8zka1wTqhO1+TjzqkJ35Hwnq75Nhc8P0YdbKkTsaXk0hD0Fw7ltx
 rb/VMcAsLJdxQzZb7A22gwg0OV+hDIHjeyj90R6ZPC1E5eR+ZXwyZQBJ8bnIT7vSHBv+h8cr
X-Proofpoint-ORIG-GUID: YUROhONYp6kVTgD1M8vA_LqjyT2cFXyb
X-Proofpoint-GUID: YUROhONYp6kVTgD1M8vA_LqjyT2cFXyb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-24_01,2025-07-23_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 mlxscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507240062

On Thu, 24 Jul 2025 at 10:35, Ram Kumar Dwivedi
<quic_rdwivedi@quicinc.com> wrote:
>
>
>
> On 23-Jul-25 12:24 AM, Dmitry Baryshkov wrote:
> > On Tue, Jul 22, 2025 at 09:41:01PM +0530, Ram Kumar Dwivedi wrote:
> >> Add optional device tree properties to limit Tx/Rx gear and rate durin=
g UFS
> >> initialization. Parse these properties in ufs_qcom_init() and apply th=
em to
> >> host->host_params to enforce platform-specific constraints.
> >>
> >> Use this mechanism to cap the maximum gear or rate on platforms with
> >> hardware limitations, such as those required by some automotive custom=
ers
> >> using SA8155. Preserve the default behavior if the properties are not
> >> specified in the device tree.
> >>
> >> Signed-off-by: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
> >> ---
> >>  drivers/ufs/host/ufs-qcom.c | 28 ++++++++++++++++++++++------
> >>  1 file changed, 22 insertions(+), 6 deletions(-)
> >>
> >> diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
> >> index 4bbe4de1679b..5e7fd3257aca 100644
> >> --- a/drivers/ufs/host/ufs-qcom.c
> >> +++ b/drivers/ufs/host/ufs-qcom.c
> >> @@ -494,12 +494,8 @@ static int ufs_qcom_power_up_sequence(struct ufs_=
hba *hba)
> >>       * If the HS-G5 PHY gear is used, update host_params->hs_rate to =
Rate-A,
> >>       * so that the subsequent power mode change shall stick to Rate-A=
.
> >>       */
> >> -    if (host->hw_ver.major =3D=3D 0x5) {
> >> -            if (host->phy_gear =3D=3D UFS_HS_G5)
> >> -                    host_params->hs_rate =3D PA_HS_MODE_A;
> >> -            else
> >> -                    host_params->hs_rate =3D PA_HS_MODE_B;
> >> -    }
> >> +    if (host->hw_ver.major =3D=3D 0x5 && host->phy_gear =3D=3D UFS_HS=
_G5)
> >> +            host_params->hs_rate =3D PA_HS_MODE_A;
> >
> > Why? This doesn't seem related.
>
> Hi Dmitry,
>
> I have refactored the patch to put this part in a separate patch in lates=
t patchset.
>
> Thanks,
> Ram.
>
> >
> >>
> >>      mode =3D host_params->hs_rate =3D=3D PA_HS_MODE_B ? PHY_MODE_UFS_=
HS_B : PHY_MODE_UFS_HS_A;
> >>
> >> @@ -1096,6 +1092,25 @@ static void ufs_qcom_set_phy_gear(struct ufs_qc=
om_host *host)
> >>      }
> >>  }
> >>
> >> +static void ufs_qcom_parse_limits(struct ufs_qcom_host *host)
> >> +{
> >> +    struct ufs_host_params *host_params =3D &host->host_params;
> >> +    struct device_node *np =3D host->hba->dev->of_node;
> >> +    u32 hs_gear, hs_rate =3D 0;
> >> +
> >> +    if (!np)
> >> +            return;
> >> +
> >> +    if (!of_property_read_u32(np, "limit-hs-gear", &hs_gear)) {
> >
> > These are generic properties, so they need to be handled in a generic
> > code path.
>
> Hi Dmitry,
>
>
> Below is the probe path for the UFS-QCOM platform driver:
>
> ufs_qcom_probe
>   =E2=94=94=E2=94=80 ufshcd_platform_init
>        =E2=94=94=E2=94=80 ufshcd_init
>             =E2=94=94=E2=94=80 ufs_qcom_init
>                  =E2=94=94=E2=94=80 ufs_qcom_set_host_params
>                       =E2=94=94=E2=94=80 ufshcd_init_host_params (initial=
ized with default values)
>                            =E2=94=94=E2=94=80 ufs_qcom_get_hs_gear (overr=
ides gear based on controller capability)
>                                 =E2=94=94=E2=94=80 ufs_qcom_set_phy_gear =
(further overrides based on controller limitations)
>
>
> The reason I added the logic in ufs-qcom.c is that even if it's placed in=
 ufshcd-platform.c, the values get overridden in ufs-qcom.c.
> If you prefer, I can move the parsing logic API to ufshcd-platform.c but =
still it needs to be called from ufs-qcom.c.

I was thinking about ufshcd_init() or similar function.

>
> Thanks,
> Ram.
>
>
> >
> > Also, the patch with bindings should preceed driver and DT changes.
>
> Hi Dmitry,
>
> I have reordered the patch series to place the DT binding change as the f=
irst patch in latest patchset.
>
> Thanks,
> Ram.
>
>
> >
> >> +            host_params->hs_tx_gear =3D hs_gear;
> >> +            host_params->hs_rx_gear =3D hs_gear;
> >> +            host->phy_gear =3D hs_gear;
> >> +    }
> >> +
> >> +    if (!of_property_read_u32(np, "limit-rate", &hs_rate))
> >> +            host_params->hs_rate =3D hs_rate;
> >> +}
> >> +
> >>  static void ufs_qcom_set_host_params(struct ufs_hba *hba)
> >>  {
> >>      struct ufs_qcom_host *host =3D ufshcd_get_variant(hba);
> >> @@ -1337,6 +1352,7 @@ static int ufs_qcom_init(struct ufs_hba *hba)
> >>      ufs_qcom_advertise_quirks(hba);
> >>      ufs_qcom_set_host_params(hba);
> >>      ufs_qcom_set_phy_gear(host);
> >> +    ufs_qcom_parse_limits(host);
> >>
> >>      err =3D ufs_qcom_ice_init(host);
> >>      if (err)
> >> --
> >> 2.50.1
> >>
> >
>


--=20
With best wishes
Dmitry

