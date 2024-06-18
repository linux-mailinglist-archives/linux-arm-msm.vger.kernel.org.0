Return-Path: <linux-arm-msm+bounces-23142-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C9D090DEF4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2024 00:07:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E48EAB21EC3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2024 22:07:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B403D178378;
	Tue, 18 Jun 2024 22:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="fZmnRh7T"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A0281C2BD;
	Tue, 18 Jun 2024 22:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718748461; cv=none; b=YKdCZgcecNXQCHSoLbUZcF5+P+ldMyiuII/TLnzT4lfXRQiVWeqBPmWYxbcsg/giVKxzJc1KT1SlMgjYKctnJQGOe23x16zCNrgHv/+/kW5EApX8DFH49jqrA/RzvG0tAf93ZHzlyFxOJKaJ6v6L5dHGYhs8xmN/xyexdN0XJ2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718748461; c=relaxed/simple;
	bh=vshtYJ6auOWRkjWkQysHLBE7xhnTPobPLeAKIUjR0ak=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=FlTMyc6hD60yaWfVBFf8U68x74AuycRaKAtl4rs8/UqALlyquqSegTPDLYfSdYyeTdhHigQl/033ky4/ZDJxFlDR/9LnDy6bFAEstp2GBGsJkryf7aoDiLM17yAvOWip50ojkCvwVxe8BgPVPqM2wJcNwhN335gVRTL3Yz3E8nE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=fZmnRh7T; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45ILbUud007757;
	Tue, 18 Jun 2024 22:07:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	e4GxQEU865+I+Ap5uFV4RigVEcUPLczIXhdKtfPyRfw=; b=fZmnRh7T8Bces6zh
	SsmrVvD2sbd0FJBuvv7L25zhSmbsSHJpc3rUvUH+tghqLRqbsuLBIBb1w2dMYjXa
	B0MqsyuuXOAFo8iKV/Gio76o5fHBlf19LfZ3fJkMh56PT4MK9iIQ0RgFe4oHTboZ
	xOZCjwAhPfQGaJSE0pG8FFaN8or1x8kZm6xO25BsqSh2Ms74B+nKQQE3Z0io2bgF
	iv0YnrEK+bzgHEgkG3xlQAh+Z4z502y7XWavxoCIl3Tw3m8QVEllDha32gOmKie0
	lunmlayQz75GzskBfE/iuToj5b5sAs688IH7/4Q6HNXGXxA3M1rvm9UamcDeHJpK
	RsZ/cw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yujag01jf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Jun 2024 22:07:19 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45IM7Ivf005763
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Jun 2024 22:07:18 GMT
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 18 Jun 2024 15:07:14 -0700
Received: from nalasex01a.na.qualcomm.com ([fe80::62ba:cee1:5495:c89]) by
 nalasex01a.na.qualcomm.com ([fe80::62ba:cee1:5495:c89%4]) with mapi id
 15.02.1544.009; Tue, 18 Jun 2024 15:07:14 -0700
From: "Gaurav Kashyap (QUIC)" <quic_gaurkash@quicinc.com>
To: "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>,
        "Gaurav
 Kashyap (QUIC)" <quic_gaurkash@quicinc.com>
CC: "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
        "andersson@kernel.org" <andersson@kernel.org>,
        "ebiggers@google.com"
	<ebiggers@google.com>,
        "neil.armstrong@linaro.org"
	<neil.armstrong@linaro.org>,
        srinivas.kandagatla
	<srinivas.kandagatla@linaro.org>,
        "krzysztof.kozlowski+dt@linaro.org"
	<krzysztof.kozlowski+dt@linaro.org>,
        "conor+dt@kernel.org"
	<conor+dt@kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        kernel
	<kernel@quicinc.com>,
        "linux-crypto@vger.kernel.org"
	<linux-crypto@vger.kernel.org>,
        "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>,
        "Om Prakash Singh (QUIC)"
	<quic_omprsing@quicinc.com>,
        "Bao D. Nguyen (QUIC)"
	<quic_nguyenb@quicinc.com>,
        bartosz.golaszewski
	<bartosz.golaszewski@linaro.org>,
        "konrad.dybcio@linaro.org"
	<konrad.dybcio@linaro.org>,
        "ulf.hansson@linaro.org"
	<ulf.hansson@linaro.org>,
        "jejb@linux.ibm.com" <jejb@linux.ibm.com>,
        "martin.petersen@oracle.com" <martin.petersen@oracle.com>,
        "mani@kernel.org"
	<mani@kernel.org>,
        "davem@davemloft.net" <davem@davemloft.net>,
        "herbert@gondor.apana.org.au" <herbert@gondor.apana.org.au>,
        Prasad Sodagudi
	<psodagud@quicinc.com>,
        Sonal Gupta <sonalg@quicinc.com>
Subject: RE: [PATCH v5 04/15] soc: qcom: ice: add hwkm support in ice
Thread-Topic: [PATCH v5 04/15] soc: qcom: ice: add hwkm support in ice
Thread-Index: AQHawFGQ2Cb4IdeC1UawBk8ySHD6CrHMC+2AgAKAhjA=
Date: Tue, 18 Jun 2024 22:07:14 +0000
Message-ID: <96e2ce4b154a4f918be0bc2a45011e6d@quicinc.com>
References: <20240617005825.1443206-1-quic_gaurkash@quicinc.com>
 <20240617005825.1443206-5-quic_gaurkash@quicinc.com>
 <3eehkn3cdhhjfqtzpahxhjxtu5uqwhntpgu22k3hknctrop3g5@f7dhwvdvhr3k>
In-Reply-To: <3eehkn3cdhhjfqtzpahxhjxtu5uqwhntpgu22k3hknctrop3g5@f7dhwvdvhr3k>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 51Uig091LoehcODDGFqcphBcAsS3zefx
X-Proofpoint-ORIG-GUID: 51Uig091LoehcODDGFqcphBcAsS3zefx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-18_04,2024-06-17_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 mlxscore=0 adultscore=0 mlxlogscore=999 impostorscore=0
 spamscore=0 bulkscore=0 malwarescore=0 clxscore=1011 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406180162

Hello Dmitry,

On 06/17/2024 12:55 AM PDT, Dmitry Baryshkov wrote:
> On Sun, Jun 16, 2024 at 05:50:59PM GMT, Gaurav Kashyap wrote:
> > Qualcomm's ICE (Inline Crypto Engine) contains a proprietary key
> > management hardware called Hardware Key Manager (HWKM).
> > This patch integrates HWKM support in ICE when it is available. HWKM
> > primarily provides hardware wrapped key support where the ICE
> > (storage) keys are not available in software and protected in
> > hardware.
> >
> > When HWKM software support is not fully available (from Trustzone),
> > there can be a scenario where the ICE hardware supports HWKM, but it
> > cannot be used for wrapped keys. In this case, standard keys have to
> > be used without using HWKM. Hence, providing a toggle controlled by a
> > devicetree entry to use HWKM or not.
> >
> > Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
> > Signed-off-by: Gaurav Kashyap <quic_gaurkash@quicinc.com>
> > ---
> >  drivers/soc/qcom/ice.c | 153
> +++++++++++++++++++++++++++++++++++++++--
> >  include/soc/qcom/ice.h |   1 +
> >  2 files changed, 150 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/soc/qcom/ice.c b/drivers/soc/qcom/ice.c index
> > 6f941d32fffb..d5e74cf2946b 100644
> > --- a/drivers/soc/qcom/ice.c
> > +++ b/drivers/soc/qcom/ice.c
> > @@ -26,6 +26,40 @@
> >  #define QCOM_ICE_REG_FUSE_SETTING            0x0010
> >  #define QCOM_ICE_REG_BIST_STATUS             0x0070
> >  #define QCOM_ICE_REG_ADVANCED_CONTROL                0x1000
> > +#define QCOM_ICE_REG_CONTROL                 0x0
> > +/* QCOM ICE HWKM registers */
> > +#define QCOM_ICE_REG_HWKM_TZ_KM_CTL                  0x1000
> > +#define QCOM_ICE_REG_HWKM_TZ_KM_STATUS                       0x1004
> > +#define QCOM_ICE_REG_HWKM_BANK0_BANKN_IRQ_STATUS     0x2008
> > +#define QCOM_ICE_REG_HWKM_BANK0_BBAC_0                       0x5000
> > +#define QCOM_ICE_REG_HWKM_BANK0_BBAC_1                       0x5004
> > +#define QCOM_ICE_REG_HWKM_BANK0_BBAC_2                       0x5008
> > +#define QCOM_ICE_REG_HWKM_BANK0_BBAC_3                       0x500C
> > +#define QCOM_ICE_REG_HWKM_BANK0_BBAC_4                       0x5010
> > +
> > +/* QCOM ICE HWKM reg vals */
> > +#define QCOM_ICE_HWKM_BIST_DONE_V1           BIT(16)
> > +#define QCOM_ICE_HWKM_BIST_DONE_V2           BIT(9)
> > +#define QCOM_ICE_HWKM_BIST_DONE(ver)
> QCOM_ICE_HWKM_BIST_DONE_V##ver
> > +
> > +#define QCOM_ICE_HWKM_CRYPTO_BIST_DONE_V1            BIT(14)
> > +#define QCOM_ICE_HWKM_CRYPTO_BIST_DONE_V2            BIT(7)
> > +#define QCOM_ICE_HWKM_CRYPTO_BIST_DONE(v)
> QCOM_ICE_HWKM_CRYPTO_BIST_DONE_V##v
> > +
> > +#define QCOM_ICE_HWKM_BOOT_CMD_LIST1_DONE            BIT(2)
> > +#define QCOM_ICE_HWKM_BOOT_CMD_LIST0_DONE            BIT(1)
> > +#define QCOM_ICE_HWKM_KT_CLEAR_DONE                  BIT(0)
> > +
> > +#define QCOM_ICE_HWKM_BIST_VAL(v)
> (QCOM_ICE_HWKM_BIST_DONE(v) |           \
> > +                                     QCOM_ICE_HWKM_CRYPTO_BIST_DONE(v)=
 |     \
> > +                                     QCOM_ICE_HWKM_BOOT_CMD_LIST1_DONE=
 |     \
> > +                                     QCOM_ICE_HWKM_BOOT_CMD_LIST0_DONE=
 |     \
> > +                                     QCOM_ICE_HWKM_KT_CLEAR_DONE)
> > +
> > +#define QCOM_ICE_HWKM_V1_STANDARD_MODE_VAL   (BIT(0) | BIT(1)
> | BIT(2))
> > +#define QCOM_ICE_HWKM_V2_STANDARD_MODE_MASK
> GENMASK(31, 1) #define
> > +QCOM_ICE_HWKM_DISABLE_CRC_CHECKS_VAL (BIT(1) | BIT(2))
> > +#define QCOM_ICE_HWKM_RSP_FIFO_CLEAR_VAL     BIT(3)
> >
> >  /* BIST ("built-in self-test") status flags */
> >  #define QCOM_ICE_BIST_STATUS_MASK            GENMASK(31, 28)
> > @@ -34,6 +68,9 @@
> >  #define QCOM_ICE_FORCE_HW_KEY0_SETTING_MASK  0x2  #define
> > QCOM_ICE_FORCE_HW_KEY1_SETTING_MASK  0x4
> >
> > +#define QCOM_ICE_HWKM_REG_OFFSET     0x8000
> > +#define HWKM_OFFSET(reg)             ((reg) +
> QCOM_ICE_HWKM_REG_OFFSET)
> > +
> >  #define qcom_ice_writel(engine, val, reg)    \
> >       writel((val), (engine)->base + (reg))
> >
> > @@ -46,6 +83,9 @@ struct qcom_ice {
> >       struct device_link *link;
> >
> >       struct clk *core_clk;
> > +     u8 hwkm_version;
> > +     bool use_hwkm;
> > +     bool hwkm_init_complete;
> >  };
> >
> >  static bool qcom_ice_check_supported(struct qcom_ice *ice) @@ -63,8
> > +103,21 @@ static bool qcom_ice_check_supported(struct qcom_ice *ice)
> >               return false;
> >       }
> >
> > -     dev_info(dev, "Found QC Inline Crypto Engine (ICE) v%d.%d.%d\n",
> > -              major, minor, step);
> > +     if (major >=3D 4 || (major =3D=3D 3 && minor =3D=3D 2 && step >=
=3D 1))
> > +             ice->hwkm_version =3D 2;
> > +     else if (major =3D=3D 3 && minor =3D=3D 2)
> > +             ice->hwkm_version =3D 1;
> > +     else
> > +             ice->hwkm_version =3D 0;
> > +
> > +     if (ice->hwkm_version =3D=3D 0)
> > +             ice->use_hwkm =3D false;
> > +
> > +     dev_info(dev, "Found QC Inline Crypto Engine (ICE) v%d.%d.%d,
> HWKM v%d\n",
> > +              major, minor, step, ice->hwkm_version);
> > +
> > +     if (!ice->use_hwkm)
> > +             dev_info(dev, "QC ICE HWKM (Hardware Key Manager) not
> > + used/supported");
> >
> >       /* If fuses are blown, ICE might not work in the standard way. */
> >       regval =3D qcom_ice_readl(ice, QCOM_ICE_REG_FUSE_SETTING); @@
> > -113,27 +166,106 @@ static void qcom_ice_optimization_enable(struct
> qcom_ice *ice)
> >   * fails, so we needn't do it in software too, and (c) properly testin=
g
> >   * storage encryption requires testing the full storage stack anyway,
> >   * and not relying on hardware-level self-tests.
> > + *
> > + * However, we still care about if HWKM BIST failed (when supported)
> > + as
> > + * important functionality would fail later, so disable hwkm on failur=
e.
> >   */
> >  static int qcom_ice_wait_bist_status(struct qcom_ice *ice)  {
> >       u32 regval;
> > +     u32 bist_done_val;
> >       int err;
> >
> >       err =3D readl_poll_timeout(ice->base + QCOM_ICE_REG_BIST_STATUS,
> >                                regval, !(regval & QCOM_ICE_BIST_STATUS_=
MASK),
> >                                50, 5000);
> > -     if (err)
> > +     if (err) {
> >               dev_err(ice->dev, "Timed out waiting for ICE self-test
> > to complete\n");
> > +             return err;
> > +     }
> >
> > +     if (ice->use_hwkm) {
> > +             bist_done_val =3D ice->hwkm_version =3D=3D 1 ?
> > +                             QCOM_ICE_HWKM_BIST_VAL(1) :
> > +                             QCOM_ICE_HWKM_BIST_VAL(2);
> > +             if (qcom_ice_readl(ice,
> > +
> HWKM_OFFSET(QCOM_ICE_REG_HWKM_TZ_KM_STATUS)) !=3D
> > +                                bist_done_val) {
> > +                     dev_err(ice->dev, "HWKM BIST error\n");
> > +                     ice->use_hwkm =3D false;
> > +                     err =3D -ENODEV;
> > +             }
> > +     }
> >       return err;
> >  }
> >
> > +static void qcom_ice_enable_standard_mode(struct qcom_ice *ice) {
> > +     u32 val =3D 0;
> > +
> > +     /*
> > +      * When ICE is in standard (hwkm) mode, it supports HW wrapped
> > +      * keys, and when it is in legacy mode, it only supports standard
> > +      * (non HW wrapped) keys.
>=20
> I can't say this is very logical.
>=20
> standard mode =3D> HW wrapped keys
> legacy mode =3D> standard keys
>=20
> Consider changing the terms.
>=20

Ack, will make this clearer

> > +      *
> > +      * Put ICE in standard mode, ICE defaults to legacy mode.
> > +      * Legacy mode - ICE HWKM slave not supported.
> > +      * Standard mode - ICE HWKM slave supported.
>=20
> s/slave/some other term/
>=20
Ack - will address this.

> Is it possible to use both kind of keys when working on standard mode?
> If not, it should be the user who selects what type of keys to be used.
> Enforcing this via DT is not a way to go.
>=20

Unfortunately, that support is not there yet. When you say user, do you mea=
n to have it as a filesystem
mount option?

The way the UFS/EMMC crypto layer is designed currently is that, this infor=
mation
is needed when the modules are loaded.
https://lore.kernel.org/all/20231104211259.17448-2-ebiggers@kernel.org/#Z31=
drivers:ufs:core:ufshcd-crypto.c

I am thinking of a way now to do this with DT, but without having a new ven=
dor property.
Is it acceptable to use the addressable range as the deciding factor? Say u=
se legacy mode of ICE
when the addressable size is 0x8000 and use HWKM mode of ICE when the addre=
ssable size is
0x10000.

> > +      *
> > +      * Depending on the version of HWKM, it is controlled by differen=
t
> > +      * registers in ICE.
> > +      */
> > +     if (ice->hwkm_version >=3D 2) {
> > +             val =3D qcom_ice_readl(ice, QCOM_ICE_REG_CONTROL);
> > +             val =3D val & QCOM_ICE_HWKM_V2_STANDARD_MODE_MASK;
> > +             qcom_ice_writel(ice, val, QCOM_ICE_REG_CONTROL);
> > +     } else {
> > +             qcom_ice_writel(ice,
> QCOM_ICE_HWKM_V1_STANDARD_MODE_VAL,
> > +                             HWKM_OFFSET(QCOM_ICE_REG_HWKM_TZ_KM_CTL))=
;
> > +     }
> > +}
> > +
> > +static void qcom_ice_hwkm_init(struct qcom_ice *ice) {
> > +     /* Disable CRC checks. This HWKM feature is not used. */
> > +     qcom_ice_writel(ice, QCOM_ICE_HWKM_DISABLE_CRC_CHECKS_VAL,
> > +                     HWKM_OFFSET(QCOM_ICE_REG_HWKM_TZ_KM_CTL));
> > +
> > +     /*
> > +      * Give register bank of the HWKM slave access to read and modify
> > +      * the keyslots in ICE HWKM slave. Without this, trustzone will n=
ot
> > +      * be able to program keys into ICE.
> > +      */
> > +     qcom_ice_writel(ice, GENMASK(31, 0),
> HWKM_OFFSET(QCOM_ICE_REG_HWKM_BANK0_BBAC_0));
> > +     qcom_ice_writel(ice, GENMASK(31, 0),
> HWKM_OFFSET(QCOM_ICE_REG_HWKM_BANK0_BBAC_1));
> > +     qcom_ice_writel(ice, GENMASK(31, 0),
> HWKM_OFFSET(QCOM_ICE_REG_HWKM_BANK0_BBAC_2));
> > +     qcom_ice_writel(ice, GENMASK(31, 0),
> HWKM_OFFSET(QCOM_ICE_REG_HWKM_BANK0_BBAC_3));
> > +     qcom_ice_writel(ice, GENMASK(31, 0),
> > + HWKM_OFFSET(QCOM_ICE_REG_HWKM_BANK0_BBAC_4));
> > +
> > +     /* Clear HWKM response FIFO before doing anything */
> > +     qcom_ice_writel(ice, QCOM_ICE_HWKM_RSP_FIFO_CLEAR_VAL,
> > +
> HWKM_OFFSET(QCOM_ICE_REG_HWKM_BANK0_BANKN_IRQ_STATUS));
> > +     ice->hwkm_init_complete =3D true;
> > +}
> > +
> >  int qcom_ice_enable(struct qcom_ice *ice)  {
> > +     int err;
> > +
> >       qcom_ice_low_power_mode_enable(ice);
> >       qcom_ice_optimization_enable(ice);
> >
> > -     return qcom_ice_wait_bist_status(ice);
> > +     if (ice->use_hwkm)
> > +             qcom_ice_enable_standard_mode(ice);
> > +
> > +     err =3D qcom_ice_wait_bist_status(ice);
> > +     if (err)
> > +             return err;
> > +
> > +     if (ice->use_hwkm)
> > +             qcom_ice_hwkm_init(ice);
> > +
> > +     return err;
> >  }
> >  EXPORT_SYMBOL_GPL(qcom_ice_enable);
> >
> > @@ -149,6 +281,10 @@ int qcom_ice_resume(struct qcom_ice *ice)
> >               return err;
> >       }
> >
> > +     if (ice->use_hwkm) {
> > +             qcom_ice_enable_standard_mode(ice);
> > +             qcom_ice_hwkm_init(ice);
> > +     }
> >       return qcom_ice_wait_bist_status(ice);  }
> > EXPORT_SYMBOL_GPL(qcom_ice_resume);
> > @@ -156,6 +292,7 @@ EXPORT_SYMBOL_GPL(qcom_ice_resume);
> >  int qcom_ice_suspend(struct qcom_ice *ice)  {
> >       clk_disable_unprepare(ice->core_clk);
> > +     ice->hwkm_init_complete =3D false;
> >
> >       return 0;
> >  }
> > @@ -205,6 +342,12 @@ int qcom_ice_evict_key(struct qcom_ice *ice, int
> > slot)  }  EXPORT_SYMBOL_GPL(qcom_ice_evict_key);
> >
>=20
> Documentation?
>=20
> > +bool qcom_ice_hwkm_supported(struct qcom_ice *ice)
> > +{
> > +     return ice->use_hwkm;
>=20
> I see that use_hwkm can change during runtime. Will it have an impact on
> a driver that calls this first?
>=20
> > +}
> > +EXPORT_SYMBOL_GPL(qcom_ice_hwkm_supported);
> > +
> >  static struct qcom_ice *qcom_ice_create(struct device *dev,
> >                                       void __iomem *base)
> >  {
> > @@ -239,6 +382,8 @@ static struct qcom_ice *qcom_ice_create(struct
> device *dev,
> >               engine->core_clk =3D devm_clk_get_enabled(dev, NULL);
> >       if (IS_ERR(engine->core_clk))
> >               return ERR_CAST(engine->core_clk);
> > +     engine->use_hwkm =3D of_property_read_bool(dev->of_node,
> > +                                              "qcom,ice-use-hwkm");
>=20
> DT bindings should come before driver changes.
>=20
> >
> >       if (!qcom_ice_check_supported(engine))
> >               return ERR_PTR(-EOPNOTSUPP);
> > diff --git a/include/soc/qcom/ice.h b/include/soc/qcom/ice.h
> > index 9dd835dba2a7..1f52e82e3e1c 100644
> > --- a/include/soc/qcom/ice.h
> > +++ b/include/soc/qcom/ice.h
> > @@ -34,5 +34,6 @@ int qcom_ice_program_key(struct qcom_ice *ice,
> >                        const struct blk_crypto_key *bkey,
> >                        u8 data_unit_size, int slot);
> >  int qcom_ice_evict_key(struct qcom_ice *ice, int slot);
> > +bool qcom_ice_hwkm_supported(struct qcom_ice *ice);
> >  struct qcom_ice *of_qcom_ice_get(struct device *dev);
> >  #endif /* __QCOM_ICE_H__ */
> > --
> > 2.43.0
> >
>=20
> --
> With best wishes
> Dmitry

Regards,
Gaurav

