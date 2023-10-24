Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 232867D58F7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Oct 2023 18:43:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234898AbjJXQnE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 Oct 2023 12:43:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232214AbjJXQnD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 Oct 2023 12:43:03 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B946D7F;
        Tue, 24 Oct 2023 09:43:01 -0700 (PDT)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39OCtfkU029457;
        Tue, 24 Oct 2023 16:42:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=date : from : to :
 cc : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=qcppdkim1; bh=qKsHb9AyMqgnMUnGQn03phIvjduJKWG8eRweFJAjT5A=;
 b=TGZD5zPOXxvfNPLvAMbbuOQj5rL4BFR3d3JTM9BHScKnFmimjn/BkdXXcVKo4HPbbzPa
 vIx+gvTbLmRhoxW8vf6RzT4SmX7aG7G04zS2KKW2y4Ea9y01brD2BlVDYB7s1HTygW7v
 VSJ86nnRw8mojsBZh0iFX6UxydQOx3WpwwvvE4PTKp3pT1JsyAe88VUgQulVxbPdDMsh
 gbWbNQGsHR3SjAgBKsFGHNNYabmfrrKp8V0ehT+87TUlN/BMO9IGTYt9lqWnLoTLFgNT
 mPC8Q+Zrkpj4tKGtjH4U4bm/FPsnITjhSN2wfKEzEJV9PooFVPK3+nK6bkKnULTYz9N0 HA== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3twtxwu3cb-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 24 Oct 2023 16:42:56 +0000
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
        by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 39OGgu3Q021059
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 24 Oct 2023 16:42:56 GMT
Received: from hu-bjorande-lv.qualcomm.com (10.49.16.6) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.39; Tue, 24 Oct 2023 09:42:55 -0700
Date:   Tue, 24 Oct 2023 09:42:54 -0700
From:   Bjorn Andersson <quic_bjorande@quicinc.com>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH 1/2] usb: typec: ucsi: fix UCSI on buggy Qualcomm devices
Message-ID: <20231024164254.GP3553829@hu-bjorande-lv.qualcomm.com>
References: <20231023215327.695720-1-dmitry.baryshkov@linaro.org>
 <20231023215327.695720-2-dmitry.baryshkov@linaro.org>
 <20231023224715.GN3553829@hu-bjorande-lv.qualcomm.com>
 <CAA8EJppen6Ebmv_fjdrHoUXRsFFH5TZonKck=bRDKgXTTWOxoQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAA8EJppen6Ebmv_fjdrHoUXRsFFH5TZonKck=bRDKgXTTWOxoQ@mail.gmail.com>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 4bgTPzqTbFDYjMUF8DZ3Rbw6Q9jfmt0V
X-Proofpoint-GUID: 4bgTPzqTbFDYjMUF8DZ3Rbw6Q9jfmt0V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-24_16,2023-10-24_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 clxscore=1015 phishscore=0 adultscore=0 spamscore=0
 malwarescore=0 bulkscore=0 impostorscore=0 suspectscore=0 mlxscore=0
 mlxlogscore=784 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2310170001 definitions=main-2310240144
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Oct 24, 2023 at 02:08:33AM +0300, Dmitry Baryshkov wrote:
> On Tue, 24 Oct 2023 at 01:47, Bjorn Andersson <quic_bjorande@quicinc.com> wrote:
> >
> > On Tue, Oct 24, 2023 at 12:47:26AM +0300, Dmitry Baryshkov wrote:
> > > On sevral Qualcomm platforms (SC8180X, SM8350, SC8280XP) a call to
> > > UCSI_GET_PDOS for non-PD partners will cause a firmware crash with no
> > > easy way to recover from it. Since we have no easy way to determine
> > > whether the partner really has PD support, shortcut UCSI_GET_PDOS on
> > > such platforms. This allows us to enable UCSI support on such devices.
> > >
> >
> > Really nice to see this. Thanks.
> >
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > ---
> > >  drivers/usb/typec/ucsi/ucsi.c       | 3 +++
> > >  drivers/usb/typec/ucsi/ucsi.h       | 3 +++
> > >  drivers/usb/typec/ucsi/ucsi_glink.c | 3 +++
> > >  3 files changed, 9 insertions(+)
> > >
> > > diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
> > > index 61b64558f96c..5392ec698959 100644
> > > --- a/drivers/usb/typec/ucsi/ucsi.c
> > > +++ b/drivers/usb/typec/ucsi/ucsi.c
> > > @@ -578,6 +578,9 @@ static int ucsi_read_pdos(struct ucsi_connector *con,
> > >       u64 command;
> > >       int ret;
> > >
> > > +     if (ucsi->quirks & UCSI_NO_PARTNER_PDOS)
> > > +             return 0;
> > > +
> > >       command = UCSI_COMMAND(UCSI_GET_PDOS) | UCSI_CONNECTOR_NUMBER(con->num);
> > >       command |= UCSI_GET_PDOS_PARTNER_PDO(is_partner);
> > >       command |= UCSI_GET_PDOS_PDO_OFFSET(offset);
> > > diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
> > > index 474315a72c77..6478016d5cb8 100644
> > > --- a/drivers/usb/typec/ucsi/ucsi.h
> > > +++ b/drivers/usb/typec/ucsi/ucsi.h
> > > @@ -317,6 +317,9 @@ struct ucsi {
> > >  #define EVENT_PENDING        0
> > >  #define COMMAND_PENDING      1
> > >  #define ACK_PENDING  2
> > > +
> > > +     unsigned long quirks;
> > > +#define UCSI_NO_PARTNER_PDOS BIT(0)  /* Don't read partner's PDOs */
> > >  };
> > >
> > >  #define UCSI_MAX_SVID                5
> > > diff --git a/drivers/usb/typec/ucsi/ucsi_glink.c b/drivers/usb/typec/ucsi/ucsi_glink.c
> > > index db6e248f8208..5c159e7b2b65 100644
> > > --- a/drivers/usb/typec/ucsi/ucsi_glink.c
> > > +++ b/drivers/usb/typec/ucsi/ucsi_glink.c
> > > @@ -327,6 +327,8 @@ static int pmic_glink_ucsi_probe(struct auxiliary_device *adev,
> > >       if (ret)
> > >               return ret;
> > >
> > > +     ucsi->ucsi->quirks = id->driver_data;
> > > +
> > >       ucsi_set_drvdata(ucsi->ucsi, ucsi);
> > >
> > >       device_for_each_child_node(dev, fwnode) {
> > > @@ -379,6 +381,7 @@ static void pmic_glink_ucsi_remove(struct auxiliary_device *adev)
> > >
> > >  static const struct auxiliary_device_id pmic_glink_ucsi_id_table[] = {
> > >       { .name = "pmic_glink.ucsi", },
> > > +     { .name = "pmic_glink.ucsi-no-pdos", .driver_data = UCSI_NO_PARTNER_PDOS, },
> >
> > In altmode and battmgr drivers we apply quirks based on the compatible
> > of the pmic_glink of_node.
> 
> ... and I can't say that I like that. In typical drivers we perform
> driver tuning by looking at the device's data (e.g. by using
> of_device_is_compatible or by of_device_get_match_data. Checking the
> parent device seems like breaking the layering.

It felt like it was the cleaner option of the two when I did it. I think
there was some variation of quirks which made me feel this would grow
large - but I might misremember things now.

> But if you insist, I can follow that approach.

I insist that we should use the same mechanism of dealing with the
quirks across the three parts, and following the existing approach
doesn't seem too unreasonable...

Thanks,
Bjorn
