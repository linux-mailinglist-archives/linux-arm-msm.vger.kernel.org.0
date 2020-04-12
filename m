Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 57FDC1A5E92
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Apr 2020 14:43:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726043AbgDLMnJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 12 Apr 2020 08:43:09 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:30156 "EHLO
        esa4.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725903AbgDLMnJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 12 Apr 2020 08:43:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1586695388; x=1618231388;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=ofgcsPUkUOrLNBw7zZlKop2j/AAuyowMH/feYE+2AxU=;
  b=kJ+496IgQzVLDqvK1MbKwLHK2LteUmhc+qzpCa/o6gMW+LQChmyvr/9+
   HVRpnX4Dvi/9LV2T8NTuFEeAOWUeI6Qwh3bKMgXWYkXvUwPQalFFYopuO
   CQ6DBXtMi0/FVWcU+TVdXVzpY5CvnBWTKYwhHI/nA/9RiEhq8pOW0o2X3
   b4Qw4B5HsQAHW33A7ODIjK0/5pg3AAYs65McjnLT5t1opN6w0yJok3MPA
   StaGt1c0hyzbApsn/zATnL+QjzgMhhlsd7pVwPZsvPIE4cxWclXvR+Zd4
   PfbFuelbH/Wn/+2/m4v1MPjxDAlMB0fGB3JzyWbpZSmBGXAHRaF1sqka1
   Q==;
IronPort-SDR: DLSojU76x+COXJxcFqRsTle2vKd5UfiWxjsezrjwZNqto2thqtLcKfDK+XPx0spN/41lPqh9oK
 omkIbqNIr9rquw1nG7Ns4c+Cm1tdgHreYR8ywKmwtBjFB64StbbYqR1dd7Q2AdofrSUplK7/Km
 7+8WrWyjNEbArLkI7hQEolG7VzwLU0naILlfwbQZTBPlAZXX3NbAQwUXs9U300+YsHtAaweOjr
 qKjhBLtqhiVSvJWcFIOGaa31Ruhbz40idybqS4+BVj0vNCPv6dWFJv6NiWM0fObEAvptEUeX5+
 2Q4=
X-IronPort-AV: E=Sophos;i="5.72,374,1580745600"; 
   d="scan'208";a="135155359"
Received: from mail-co1nam11lp2177.outbound.protection.outlook.com (HELO NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.177])
  by ob1.hgst.iphmx.com with ESMTP; 12 Apr 2020 20:43:07 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cl+HA8jec2mG4PM/G6PEEB5DqlmiWXCMEgAhoAkz5tUaHfo0D9ID/hVQVJ4+Ku9vYufZUsrEf322jlP2hF5zySVZ0hPwsjuW7/kAwAx3eFwWKixIBmc8KqJe3hk8uY8pJKLjh7dXpx0+ITGFRQ8lWNcTRn1ciJuSIDg3Kifr+ggwlAL2w2fcf7ASsOn7pspgsGEaB29b18RqhdiwtiZ4c3nCJAJVWBa6hQmnYC6o7zE1mIorGqK8B3WSR68H+RnFdYRMawdVUbcwFf6frPMA6vHYYekYB0nPbz0Cg6mhLkTamWjPZB3dLKcK0BAxBrY5PCLwpIyvzb8eYni3EkxBOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zNHEgWnuOe8sF8sYAuxXue1Y0L5gwWhRdOKvl8YvrHM=;
 b=nRzzluLzpvaLAFxr/1nOZqIfbPk8o5xCjJukcgdy4wI9OWCDCKVPLORzwF71Z1cyrFT95HntBXyPC+M2EBGrnLCNtdgvJ1PHzI3s+7aPqV7aglgBVlO1hsTyyIPCuosHNhPddrS0fDWXoEbFVibkMxZbFUahGh9+iw745IOGnbK7hkx8ft3m2pVf9y5uTEl6OfuAYYSKSyT6400He+yz8pRv7TVXb0hkWoSM1l9P15gARLN7rU3Q5H6l6DWjGI3wl88ney1ovA5cyOF7nLW8te3HtGVgVEpAlAHyx9YvLR+hbA/sDYbA5iK5YhH6Y//TPDem+qhUHSbfjRXEtPH0GQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zNHEgWnuOe8sF8sYAuxXue1Y0L5gwWhRdOKvl8YvrHM=;
 b=dpyvLMJGsKtLw7jepukx+kqEPb/zIUMuzFCBQa4dT+p49T4Si8+vVMV4/L49Az7XQaThsgv4q3g4V/kLwJdamTfANEcNJNK+r1mdLSXjqdHrcBmu7jr6Iqbw5hxCozRPaN8+OeWTUErgpYQe6j5ZvgCMvlIkr1Y3gA7Jux9+fNk=
Received: from SN6PR04MB4640.namprd04.prod.outlook.com (2603:10b6:805:a4::19)
 by SN6PR04MB4207.namprd04.prod.outlook.com (2603:10b6:805:32::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2900.26; Sun, 12 Apr
 2020 12:43:03 +0000
Received: from SN6PR04MB4640.namprd04.prod.outlook.com
 ([fe80::3877:5e49:6cdd:c8b]) by SN6PR04MB4640.namprd04.prod.outlook.com
 ([fe80::3877:5e49:6cdd:c8b%5]) with mapi id 15.20.2900.015; Sun, 12 Apr 2020
 12:43:03 +0000
From:   Avri Altman <Avri.Altman@wdc.com>
To:     Asutosh Das <asutoshd@codeaurora.org>,
        "cang@codeaurora.org" <cang@codeaurora.org>,
        "martin.petersen@oracle.com" <martin.petersen@oracle.com>,
        "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>
CC:     "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        Subhash Jadavani <subhashj@codeaurora.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        Bean Huo <beanhuo@micron.com>,
        Stanley Chu <stanley.chu@mediatek.com>,
        Tomas Winkler <tomas.winkler@intel.com>,
        Colin Ian King <colin.king@canonical.com>,
        Bart Van Assche <bvanassche@acm.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v1 1/3] scsi: ufs: add write booster feature support
Thread-Topic: [PATCH v1 1/3] scsi: ufs: add write booster feature support
Thread-Index: AQHWDe+W7UlEmvGhl0KH0X2uPaojCKh1ZZgw
Date:   Sun, 12 Apr 2020 12:43:03 +0000
Message-ID: <SN6PR04MB4640E5A6BAAD89DDC3F2FFE0FCDC0@SN6PR04MB4640.namprd04.prod.outlook.com>
References: <cover.1586374414.git.asutoshd@codeaurora.org>
 <3c186284280c37c76cf77bf482dde725359b8a8a.1586382357.git.asutoshd@codeaurora.org>
In-Reply-To: <3c186284280c37c76cf77bf482dde725359b8a8a.1586382357.git.asutoshd@codeaurora.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Avri.Altman@wdc.com; 
x-originating-ip: [212.25.79.133]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 7815af7d-9aeb-46d1-8ebe-08d7dedf0ae7
x-ms-traffictypediagnostic: SN6PR04MB4207:
x-microsoft-antispam-prvs: <SN6PR04MB4207FF4D9876AACF9985514CFCDC0@SN6PR04MB4207.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-forefront-prvs: 0371762FE7
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR04MB4640.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10019020)(4636009)(346002)(136003)(376002)(396003)(366004)(39860400002)(54906003)(186003)(33656002)(8676002)(6506007)(81156014)(71200400001)(8936002)(110136005)(7696005)(478600001)(2906002)(26005)(52536014)(55016002)(7416002)(66946007)(66476007)(66556008)(4326008)(64756008)(66446008)(76116006)(9686003)(86362001)(316002)(5660300002);DIR:OUT;SFP:1102;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: akrARh80V2aff4XkROrfNC+G3qXScBZ5v6po2Y8Lmx06uJhE0QpHLKDMA0jDdqcWUWkBR0KXg3mRrcGvKVf3KeCWqLQmc+E0ZUqFvW1S3aqoERrLWB1GtJF9mj7VztRA4NQGWwAIEY1pqLfgZAzFDpLOGudmAgB/6jtUdOTdfFxQFEnSBxEE3hw/68fjy8M2OEyLTwrLiIsS5xouZqGWJaL5enMBgo4rlxF+HOEMfNgcgLb73yE914/MIoCgFsEeI1vD5tIpkJycgGEEajnuQ2mQ/OCRvLrdGfst4zI9aCCjrpGQsdR8+IiOP+LoC/SxkpSWPxSPDlTrKSfjrG7dQCfswTgspXkq7NNpd2PlukycjV0uMkwmN40ekANoIn1cRv1bedc2C4JxuWrEdZ1kJqLHt3wFnm/BxBhkvlH0yDkYXg/dSLYUcNWliO0Oy8qY
x-ms-exchange-antispam-messagedata: AbjWdcFook4ubuaxrEEHHV9Ec/cXGx2gCCNkbxRA9O9tXeECg2Gvy57JBRR+mP5q9bdGyh1sVccG5RIcI6g7V2jiyoixk/igafpNETxGBYEdrS5ttJXRjPRzx1cTT3OOh1qdjYy7zH2V3H1c9Oav9g==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7815af7d-9aeb-46d1-8ebe-08d7dedf0ae7
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Apr 2020 12:43:03.6496
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uYCAlYnpLNN5igPgxNcQ2D5BY0b9e4Q+PrJV8dksLLRmHGeut4ZfjImMIe2mvQp067CJ1u396YfPYfJV6xNutA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR04MB4207
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

>=20
>  enum ufs_desc_def_size {
> -       QUERY_DESC_DEVICE_DEF_SIZE              =3D 0x40,
> +       QUERY_DESC_DEVICE_DEF_SIZE              =3D 0x59,
>         QUERY_DESC_CONFIGURATION_DEF_SIZE       =3D 0x90,
>         QUERY_DESC_UNIT_DEF_SIZE                =3D 0x23,
Might as well update the unit descriptor size - its 0x2D now,
As you are adding its new fields

>         QUERY_DESC_INTERCONNECT_DEF_SIZE        =3D 0x06,
> @@ -219,6 +226,7 @@ enum unit_desc_param {
>         UNIT_DESC_PARAM_PHY_MEM_RSRC_CNT        =3D 0x18,
>         UNIT_DESC_PARAM_CTX_CAPABILITIES        =3D 0x20,
>         UNIT_DESC_PARAM_LARGE_UNIT_SIZE_M1      =3D 0x22,
> +       UNIT_DESC_PARAM_WB_BUF_ALLOC_UNITS      =3D 0x29,
>  };
>=20
>  /* Device descriptor parameters offsets in bytes*/
> @@ -258,6 +266,9 @@ enum device_desc_param {
>         DEVICE_DESC_PARAM_PSA_MAX_DATA          =3D 0x25,
>         DEVICE_DESC_PARAM_PSA_TMT               =3D 0x29,
>         DEVICE_DESC_PARAM_PRDCT_REV             =3D 0x2A,
> +       DEVICE_DESC_PARAM_EXT_UFS_FEATURE_SUP   =3D 0x4F,
DEVICE_DESC_PARAM_WB_USER_TYPE               =3D 0x53,

> +       DEVICE_DESC_PARAM_WB_TYPE               =3D 0x54,
> +       DEVICE_DESC_PARAM_WB_SHARED_ALLOC_UNITS =3D 0x55,
>  };
>=20


> +enum ufs_dev_wb_buf_user_cap_config {
> +       UFS_WB_BUFF_PRESERVE_USER_SPACE =3D 1,
> +       UFS_WB_BUFF_USER_SPACE_RED_EN =3D 2,
> +};
Maybe better to follow the spec here:
Reduced - 0
Preserve - 1

> +static inline void ufshcd_wb_config(struct ufs_hba *hba)
> +{
> +       int ret;
> +
> +       if (!ufshcd_wb_sup(hba))
> +               return;
> +
> +       ret =3D ufshcd_wb_ctrl(hba, true);
Why are you setting WB on init?

> +       if (ret)
> +               dev_err(hba->dev, "%s: Enable WB failed: %d\n", __func__,=
 ret);
> +       else
> +               dev_info(hba->dev, "%s: Write Booster Configured\n", __fu=
nc__);
> +       ret =3D ufshcd_wb_toggle_flush_during_h8(hba, true);
> +       if (ret)
> +               dev_err(hba->dev, "%s: En WB flush during H8: failed: %d\=
n",
> +                       __func__, ret);
> +       ufshcd_wb_toggle_flush(hba, true);
Why set explicit flush on init?


> +
> +
> +static bool ufshcd_wb_keep_vcc_on(struct ufs_hba *hba)
> +{
> +       int ret;
> +       u32 cur_buf, avail_buf;
> +
> +       if (!ufshcd_wb_sup(hba))
> +               return false;
> +       /*
> +        * The ufs device needs the vcc to be ON to flush.
> +        * With user-space reduction enabled, it's enough to enable flush
> +        * by checking only the available buffer. The threshold
> +        * defined here is > 90% full.
> +        * With user-space preserved enabled, the current-buffer
> +        * should be checked too because the wb buffer size can reduce
> +        * when disk tends to be full. This info is provided by current
> +        * buffer (dCurrentWriteBoosterBufferSize). There's no point in
> +        * keeping vcc on when current buffer is empty.
> +        */
> +       ret =3D ufshcd_query_attr_retry(hba,
> UPIU_QUERY_OPCODE_READ_ATTR,
> +                                     QUERY_ATTR_IDN_AVAIL_WB_BUFF_SIZE,
> +                                     0, 0, &avail_buf);
> +       if (ret) {
> +               dev_warn(hba->dev, "%s dAvailableWriteBoosterBufferSize r=
ead
> failed %d\n",
> +                        __func__, ret);
> +               return false;
> +       }
> +
> +       ret =3D ufshcd_vops_get_user_cap_mode(hba);
The Preserve User Space mode should be read from -=20
bWriteBoosterBufferPreserveUserSpaceEn of the device descriptor - 0ffset 0x=
53.
The driver should have no judgement here.
Based on what is configured, better to attach a helper pointer that will pe=
rform the below check,
e.g. ufshcd_wb_preserve_keep_vcc_on() and ufshcd_wb_reduced_keep_vcc_on().
Which will simplify the logic here and make it much more readable.
This makes the preparations you made for ufshcd_vops_get_user_cap_mode,
and your second patch unneeded.


>  /**
>   * ufshcd_exception_event_handler - handle exceptions raised by device
>   * @work: pointer to work data
> @@ -6632,6 +6829,28 @@ static int ufs_get_device_desc(struct ufs_hba
> *hba)
>                                       desc_buf[DEVICE_DESC_PARAM_SPEC_VER=
 + 1];
>=20
>         model_index =3D desc_buf[DEVICE_DESC_PARAM_PRDCT_NAME];
> +       /* Enable WB only for UFS-3.1 */
> +       if (dev_info->wspecversion >=3D 0x310) {
> +               hba->dev_info.d_ext_ufs_feature_sup =3D
> +                       get_unaligned_be32(desc_buf +
> +                               DEVICE_DESC_PARAM_EXT_UFS_FEATURE_SUP);
> +               /*
> +                * WB may be supported but not configured while provision=
ing.
> +                * The spec says, in dedicated wb buffer mode,
> +                * a max of 1 lun would have wb buffer configured.
> +                * Now only shared buffer mode is supported.
> +                */
> +               hba->dev_info.b_wb_buffer_type =3D
> +                       desc_buf[DEVICE_DESC_PARAM_WB_TYPE];
> +
> +               if (!hba->dev_info.b_wb_buffer_type)
> +                       goto skip_alloc_unit;
> +               hba->dev_info.d_wb_alloc_units =3D
> +                       get_unaligned_be32(desc_buf +
> +                               DEVICE_DESC_PARAM_WB_SHARED_ALLOC_UNITS);
> +       }
Maybe pack the above code in a wb_probe() designated helper,
which will establish if WB is supported or not.
If one of your validation tests fails, maybe you can just=20
hba->caps &=3D ~UFSHCD_CAP_WB_EN;
which will further simplify your ufshcd_wb_sup()

=20
>         if ((req_dev_pwr_mode !=3D hba->curr_dev_pwr_mode) &&
> -            ((ufshcd_is_runtime_pm(pm_op) && !hba->auto_bkops_enabled) |=
|
> -              !ufshcd_is_runtime_pm(pm_op))) {
> +           ((ufshcd_is_runtime_pm(pm_op) && !hba->auto_bkops_enabled) ||
> +            !ufshcd_is_runtime_pm(pm_op))) {
Redundant space removal



Thanks,
Avri
