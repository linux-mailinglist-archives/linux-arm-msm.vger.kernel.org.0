Return-Path: <linux-arm-msm+bounces-54161-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CA7EA8794C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Apr 2025 09:45:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 04C183B358C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Apr 2025 07:43:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D1FF25A631;
	Mon, 14 Apr 2025 07:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kvtWch+Z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88A631F236B
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Apr 2025 07:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744616606; cv=none; b=G3DqYRYAjxSRHy58CA2p6w0tEzYCqWG6BNfjxWldTNx7vgWQ0xCpco4jqGMZ5lMa/+2F9SkahM9lFcBBUFnYXMlxtq/YMbNpCHSGRac8mg6MtyRWo3hkTv35mSmk1pZrGQuysUR0plHwJiTh8MPIIt7cw/RityKXe4ILmVLzHrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744616606; c=relaxed/simple;
	bh=slvBVC6hmkYGxoROIH5HdxzsQjsj+FPXh6qtqyS+NEI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fd0ztzTdujcTsZ6/WFoVY6K/L7lAhF4Y1N+ZVTf8fhrP11rh7rBFZuQp70YP+CqBBOpRPVaqCq9jxmfbFO7UsJL1v48IJ2Qg7rRfZZJq3PWheDCd9gE2wqigC5HhJEkUMLZLNtjDQ2ArxWHQvbes4CTd/L+tbGOVH5swYuz7DwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kvtWch+Z; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53DM3dPe012389
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Apr 2025 07:43:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Um1Ee0fatfSrCr9mgfrQaagy
	x2fBqusvxToSaiBP3Q0=; b=kvtWch+ZdYjXuycHx3pXD8GetCiRqYKLmtbPNll1
	EUrbuB0WMT9iBY0LIWApw19lumo9tkNyOj+7SSgvW0WXCM+Jp35Cc/f+tD0WpJD5
	HGhxmLzX3Je49Yb2zdWdnmTkB7T2IcFeoRjMP+ivOibKt3ggrXqoaI18mWZoPnjY
	vOeyZ/SnDj82DoBh4e3MNTLjxVl1N5xa1BtfqPJsbLhruLrQVH9tpjHC/ijIUnD1
	WoScX45w96aaA48CkqPh2Dsn8XYIc5n7kvjgdfSy1CGpBOuqPZ7RueLIcH5NP+Mt
	knEU20PwYBJM/TW9klPLZoJZeZxo9uYVyu2wrbfmaU2WTg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yhbpkjr6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Apr 2025 07:43:18 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c3c8f8ab79so672183285a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Apr 2025 00:43:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744616597; x=1745221397;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Um1Ee0fatfSrCr9mgfrQaagyx2fBqusvxToSaiBP3Q0=;
        b=sI4ubLw/ijv9CIyYMr6sXqUUz1icHkyFHBBu6nqm/BMashE0n5JPxrgYYv+hF26Ygh
         mpZhvRLhQ1WH1XEdV/SBd9nc2ZaXRltxTtlcmotDz+L4kTBe50fEn7tmW6rr95FPZNZy
         wXRRY7KdOFYhUnXEvsyREoWT7enCbLx5BpfTO0F6cj+KZIMdi29lwyB8VYeqPM5mnXYS
         h8nYIBwwTA0SbobMjglwR14/T1fOj4q1QI8gebG5voZg3vhEcHIhyOH7WRMA9+NdOV68
         hWeF1gYuQwEz+orO3bcBmQdMYdq7hZ57EsEad5lG3LV4KN/m7IFw98xa+Z9/NC8m3oRV
         y6+Q==
X-Forwarded-Encrypted: i=1; AJvYcCWcDxA9n/jAvctb6eQlbjV9CXeEKVCRz1M3lhjKSxSusiwkuq+PX72crrRgKC/IHxUkCV8RpXALZPLfAaMu@vger.kernel.org
X-Gm-Message-State: AOJu0YyIl9Q6Gm/XyCHq1PoXJV71tanfW/ardcfP4vThlSlHE5Vuq22K
	xO97DtmlRfjr5FvkjLBXhnNWP2C8lEOvyLcUyS8qjXlRNAXPqpUARxMt/l0cstiH224feMV8Ncp
	KZimSN35SCBj1V5FYXFR7tfFLjg0ve5l8YVN4iGwglvH6N3NX3t5LtI0wmchf/BeN
X-Gm-Gg: ASbGncuzMHWHQU4Q+q5ibIRboo1UwNdyLAoV9DihTyc65SSbxYBIxZmjylWCfc8k/82
	JpiLFkX7D8w6FNF/Y3P1eJygFMeaQMg2Vner2yaf0KRogmHRbr51e1JZYrAwcLZI0qmpIQraa55
	3Uz2M4vy7+gDuTvoTq6O+IZUL1L4n8Pl/FpMMLJgJc706knoxlsSGCkDg59HV/u8z4N9qFHlwkd
	PNCaNpubim01zIG0XAmNOCHKTstyIUHlIACKIfGVdXCDpMvG8uuCjkidZiGWwVsHfdPTbj9YdZt
	I4NAC0nQMCXknvutwNjafuakMTWrI0GQhOcOczYlu7He+WIW4Yo4U4ZAwms5RDidN0EL7+Udy3c
	=
X-Received: by 2002:a05:620a:2901:b0:7c5:49b7:237c with SMTP id af79cd13be357-7c7af14b0ccmr1859508185a.27.1744616596731;
        Mon, 14 Apr 2025 00:43:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFPTDvjXIU4+/YUQdJ7lFbDzmq8UiSQ+ZiaVzIf5dqB0Tzb8PIW8irySrnFsWhJsN4u3ncKaw==
X-Received: by 2002:a05:620a:2901:b0:7c5:49b7:237c with SMTP id af79cd13be357-7c7af14b0ccmr1859504585a.27.1744616596134;
        Mon, 14 Apr 2025 00:43:16 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f465d514csm15946351fa.78.2025.04.14.00.43.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 00:43:15 -0700 (PDT)
Date: Mon, 14 Apr 2025 10:43:13 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Nitin Rawat <quic_nitirawa@quicinc.com>
Cc: vkoul@kernel.org, kishon@kernel.org, manivannan.sadhasivam@linaro.org,
        James.Bottomley@hansenpartnership.com, martin.petersen@oracle.com,
        bvanassche@acm.org, bjorande@quicinc.com, neil.armstrong@linaro.org,
        konrad.dybcio@oss.qualcomm.com, quic_rdwivedi@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org
Subject: Re: [PATCH V3 5/9] phy: qcom-qmp-ufs: Remove qmp_ufs_com_init()
Message-ID: <sajcoh34gyfcvhik3yairil65guvp2rt2xdmbmlpmlcjvst5ci@qojbxhmrnrxj>
References: <20250410090102.20781-1-quic_nitirawa@quicinc.com>
 <20250410090102.20781-6-quic_nitirawa@quicinc.com>
 <zvc3gf7mek7u46wlcrjak3j2hihj4vfgdwpdzjhvnxxowuyvsr@hlra5bmz5ign>
 <4557abf9-bcd2-4a06-8161-43ad5047b277@quicinc.com>
 <CAO9ioeXyDWOhe1cbGO_tR=ppZd1aC0GSdeMzQjir4XmDRMQ3Jg@mail.gmail.com>
 <64216a90-e2e0-435c-87bc-388c72a702c0@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <64216a90-e2e0-435c-87bc-388c72a702c0@quicinc.com>
X-Proofpoint-ORIG-GUID: SFahDftffcjoZaU6g-k7bL8mI5iUjgvT
X-Proofpoint-GUID: SFahDftffcjoZaU6g-k7bL8mI5iUjgvT
X-Authority-Analysis: v=2.4 cv=I+plRMgg c=1 sm=1 tr=0 ts=67fcbc96 cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=JfrnYn6hAAAA:8 a=COk6AnOGAAAA:8 a=IG52YttmCyEg0bf6y1UA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=1CNFftbPRP8L7MoqJWF3:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-14_01,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 phishscore=0 adultscore=0 priorityscore=1501 mlxscore=0 lowpriorityscore=0
 bulkscore=0 mlxlogscore=999 clxscore=1015 impostorscore=0 malwarescore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504140054

On Mon, Apr 14, 2025 at 12:58:48PM +0530, Nitin Rawat wrote:
> 
> 
> On 4/11/2025 4:26 PM, Dmitry Baryshkov wrote:
> > On Fri, 11 Apr 2025 at 13:42, Nitin Rawat <quic_nitirawa@quicinc.com> wrote:
> > > 
> > > 
> > > 
> > > On 4/11/2025 1:39 AM, Dmitry Baryshkov wrote:
> > > > On Thu, Apr 10, 2025 at 02:30:58PM +0530, Nitin Rawat wrote:
> > > > > Simplify the qcom ufs phy driver by inlining qmp_ufs_com_init() into
> > > > > qmp_ufs_power_on(). This change removes unnecessary function calls and
> > > > > ensures that the initialization logic is directly within the power-on
> > > > > routine, maintaining the same functionality.
> > > > 
> > > > Which problem is this patch trying to solve?
> > > 
> > > Hi Dmitry,
> > > 
> > > As part of the patch, I simplified the code by moving qmp_ufs_com_init
> > > inline to qmp_ufs_power_on, since qmp_ufs_power_on was merely calling
> > > qmp_ufs_com_init. This change eliminates unnecessary function call.
> > 
> > You again are describing what you did. Please start by stating the
> > problem or the issue.
> > 
> > > 
> Hi Dmitry,
> 
> Sure, will update the commit with "problem" first in the next patchset when
> I post.

Before posting the next iteration, maybe you can respond inline? It well
might be that there is no problem to solve.

> 
> Thanks,
> Nitin
> 
> > > Regards,
> > > Nitin
> > > 
> > > 
> > > 
> > > > 
> > > > > 
> > > > > Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
> > > > > ---
> > > > >    drivers/phy/qualcomm/phy-qcom-qmp-ufs.c | 44 ++++++++++---------------
> > > > >    1 file changed, 18 insertions(+), 26 deletions(-)
> > > > > 
> > > > > diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
> > > > > index 12dad28cc1bd..2cc819089d71 100644
> > > > > --- a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
> > > > > +++ b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
> > > > > @@ -1757,31 +1757,6 @@ static void qmp_ufs_init_registers(struct qmp_ufs *qmp, const struct qmp_phy_cfg
> > > > >       qmp_ufs_init_all(qmp, &cfg->tbls_hs_b);
> > > > >    }
> > > > > 
> > > > > -static int qmp_ufs_com_init(struct qmp_ufs *qmp)
> > > > > -{
> > > > > -    const struct qmp_phy_cfg *cfg = qmp->cfg;
> > > > > -    void __iomem *pcs = qmp->pcs;
> > > > > -    int ret;
> > > > > -
> > > > > -    ret = regulator_bulk_enable(cfg->num_vregs, qmp->vregs);
> > > > > -    if (ret) {
> > > > > -            dev_err(qmp->dev, "failed to enable regulators, err=%d\n", ret);
> > > > > -            return ret;
> > > > > -    }
> > > > > -
> > > > > -    ret = clk_bulk_prepare_enable(qmp->num_clks, qmp->clks);
> > > > > -    if (ret)
> > > > > -            goto err_disable_regulators;
> > > > > -
> > > > > -    qphy_setbits(pcs, cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL], SW_PWRDN);
> > > > > -
> > > > > -    return 0;
> > > > > -
> > > > > -err_disable_regulators:
> > > > > -    regulator_bulk_disable(cfg->num_vregs, qmp->vregs);
> > > > > -
> > > > > -    return ret;
> > > > > -}
> > > > > 
> > > > >    static int qmp_ufs_com_exit(struct qmp_ufs *qmp)
> > > > >    {
> > > > > @@ -1799,10 +1774,27 @@ static int qmp_ufs_com_exit(struct qmp_ufs *qmp)
> > > > >    static int qmp_ufs_power_on(struct phy *phy)
> > > > >    {
> > > > >       struct qmp_ufs *qmp = phy_get_drvdata(phy);
> > > > > +    const struct qmp_phy_cfg *cfg = qmp->cfg;
> > > > > +    void __iomem *pcs = qmp->pcs;
> > > > >       int ret;
> > > > > +
> > > > >       dev_vdbg(qmp->dev, "Initializing QMP phy\n");
> > > > > 
> > > > > -    ret = qmp_ufs_com_init(qmp);
> > > > > +    ret = regulator_bulk_enable(cfg->num_vregs, qmp->vregs);
> > > > > +    if (ret) {
> > > > > +            dev_err(qmp->dev, "failed to enable regulators, err=%d\n", ret);
> > > > > +            return ret;
> > > > > +    }
> > > > > +
> > > > > +    ret = clk_bulk_prepare_enable(qmp->num_clks, qmp->clks);
> > > > > +    if (ret)
> > > > > +            goto err_disable_regulators;
> > > > > +
> > > > > +    qphy_setbits(pcs, cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL], SW_PWRDN);
> > > > > +    return 0;
> > > > > +
> > > > > +err_disable_regulators:
> > > > > +    regulator_bulk_disable(cfg->num_vregs, qmp->vregs);
> > > > >       return ret;
> > > > >    }
> > > > > 
> > > > > --
> > > > > 2.48.1
> > > > > 
> > > > 
> > > 
> > 
> > 
> 
> 
> -- 
> linux-phy mailing list
> linux-phy@lists.infradead.org
> https://lists.infradead.org/mailman/listinfo/linux-phy

-- 
With best wishes
Dmitry

