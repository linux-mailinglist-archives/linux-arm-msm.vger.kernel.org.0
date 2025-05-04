Return-Path: <linux-arm-msm+bounces-56704-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D22ECAA8778
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 May 2025 17:57:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4C12D175B32
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 May 2025 15:57:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEABA1DB951;
	Sun,  4 May 2025 15:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HG5PlqBa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 520B913A86C
	for <linux-arm-msm@vger.kernel.org>; Sun,  4 May 2025 15:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746374231; cv=none; b=ph6Wy8ed/76UkWZ2+pOyzCoIyg29tjwolmoUWouSSMmoYhmHRUqXP/t3Gy978/wAAzYP/4j83TqItMHXXVsK5NTIv9xePXc8VN5OJ9LevCtonw+OOWDNoh0SALT8UQWQblXW54qL4BZh7axNp1RSkjAMomrd+p3D+19mAZHyPUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746374231; c=relaxed/simple;
	bh=ws5bR9Wv61dsYSRAXxbC+Mar/OIdfr7Pqseo29HrxiA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mFRaZ8sSJ5FiE557UJIzWet8E1FNJdeJZTILxnCwMGZNPI8YRNB/u/7tPdRTu9/Kk5eRjoaTSuheqRlnDIa/uOLiQIbLkeQ0cv9S0vRM6zhOsFdt6NAUhXsucP4QnffF9E8i/4uNYapPSacdCCfAYvOqSIUmb5LXvKis9UmGyQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HG5PlqBa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 543NrS44016191
	for <linux-arm-msm@vger.kernel.org>; Sun, 4 May 2025 15:57:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qDJRnfFVhNlqLE4SnUMJ5AQU
	UpLQygLk0SdVxycEvNs=; b=HG5PlqBa+pWyHyYu0qj5yZRDIn6itDuaQdkD78ND
	VvkI3XxhpzkqaO9qm99XnaALzXZWFpUWfcpZnWSnIbvpP7DoRG0pDlVyWi9iTVvD
	O9zNOLAQN8L5RiRTJnqKeHgmI4f3ue0PF6dF1sqmWDkjc4HPGrh/ZO0EvXnBJlPH
	SRSddE8biB3G3AcvatdLYyXIwW7+FAfFQP3R77LXiCCCU+wUr1ujxOmWC+ekw4a6
	ecBNZUCTIaJUr1k/t6zFzpAro39jL75nmDKCz5YyZ7yJpyrNRd4eZJZZjvHLF7cW
	YVzQeTxgxbwADex52R+oOoobviPu32ZxXUImiQp7EVJ7bA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46dce9a23n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 04 May 2025 15:57:09 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-476623ba226so66571211cf.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 04 May 2025 08:57:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746374228; x=1746979028;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qDJRnfFVhNlqLE4SnUMJ5AQUUpLQygLk0SdVxycEvNs=;
        b=cwgaP2AfIfVjqVqSBdj7mN+QFh7AdS2cUkI/7JTG1NQk4iW0OiDvvobW9J0SJVE2cC
         LUNEmD+4Ckf/lWpyV9LSPjB1QmjY8lDYH9B4tw3Zhk/eRQBxBeqf+o0RCzbsh5uHMHCC
         WDCi3+Zn88IEYvoAffxNo9v2uZ5kmz67ffZz9/CEHpfaScnK/0uQAuQTcT6ZNlhuZrIH
         MNhnCxagGKnsvgDq25G7JxszdPMrqQSMcXl1Sde99/FzupB4Iu+07VBVtrLefCaoSxUx
         0vb25pZHnTTKldJJ/n1v+BlucbE6i/CXaWmEhfyyeRJopU3S3lsrmXofiTsPkytdIWpX
         +V6A==
X-Forwarded-Encrypted: i=1; AJvYcCUHBKCSTIq7yk7UxM84eWwvlH/osW+I0sipQ29CksqOnZ+AyQTh8WIRlv1EIaNCUiBYwz4mjec1uNUeqoDl@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0wTzjZzmU6RIEVgnzN23Wos/S/PC9Hm+keDYbiOWBnSrBfmmu
	B27jkUDfC1gA5xYgp+xc44vO2qzNngfuUkduAHYO5Mc2D2GNpXQopnHENIh3dw0JOgdqAa5lAOT
	Ce5zEeDuaG6Pt5UE4Xm+qKcSQCAMIjaHZBtjLOeR7NOTd9/UnlF00o5YG8QMmS51T
X-Gm-Gg: ASbGncvoO8nBcRanHoEqQdEBnxtAu481yvg4XILJ4JIsKZce9+2N9Lzx8QXxP5SaiVL
	s30TbzMfANIovaBawXDfXpKlL78zIPoDVLayo/jN5BfnXHtgDUVmrsilLOvJHy3lg2SHwIwBgTE
	SEFaEJJYwPgwCCBUs4uMuyAg8MgGQTnDP3xIxIeB6uUhHx5mj6ffKQe23bhzsKVCH+8TniAHsDS
	t/csYE/5bNDkBbHciBT7O+GYd8mQePcl5gOZMZGCHo8FPWiG9p0xTsM0AdprwXSUcFcBngTxLxE
	aFC692dYI0/6o9hidY+uYJvjIsxOz1wJK5s8gVKmgIyIKbh6rEwl+12JuBiAfPEF+q1EeDrZviI
	=
X-Received: by 2002:a05:622a:1927:b0:476:b783:c94d with SMTP id d75a77b69052e-48d5d6eab60mr99066131cf.35.1746374228042;
        Sun, 04 May 2025 08:57:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHl+RObbi8pYcCw562FT5x6OBUuklTXyziCWKvhn7Q2lEQWFRKfXZzHATAw30qGOY5a3VLc0Q==
X-Received: by 2002:a05:622a:1927:b0:476:b783:c94d with SMTP id d75a77b69052e-48d5d6eab60mr99065941cf.35.1746374227706;
        Sun, 04 May 2025 08:57:07 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ea94f21f1sm1307550e87.200.2025.05.04.08.57.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 08:57:06 -0700 (PDT)
Date: Sun, 4 May 2025 18:57:05 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Nitin Rawat <quic_nitirawa@quicinc.com>
Cc: vkoul@kernel.org, kishon@kernel.org, manivannan.sadhasivam@linaro.org,
        James.Bottomley@hansenpartnership.com, martin.petersen@oracle.com,
        bvanassche@acm.org, andersson@kernel.org, neil.armstrong@linaro.org,
        konrad.dybcio@oss.qualcomm.com, quic_rdwivedi@quicinc.com,
        quic_cang@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org
Subject: Re: [PATCH V4 06/11] phy: qcom-qmp-ufs: Rename qmp_ufs_power_off
Message-ID: <djippxc7ile62qzirggt5ry5wswgy3oabgeq5hpkambcm3aub7@dgnc6qtk5hvr>
References: <20250503162440.2954-1-quic_nitirawa@quicinc.com>
 <20250503162440.2954-7-quic_nitirawa@quicinc.com>
 <prbe2guxzsea6aqonf32m44zp6oa3vzdf5ieazcontv4fmx3d3@2r4tu5nr2k4x>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <prbe2guxzsea6aqonf32m44zp6oa3vzdf5ieazcontv4fmx3d3@2r4tu5nr2k4x>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA0MDE0OSBTYWx0ZWRfX5xxBZVkh4NAa
 bSFL7XgA8ybUoAohO4A7yzkK0xlitYrtMIqooTFqiy+ZytFWnytWKQMmOZdomBFD61l209e0T0G
 qMRml2k58vka8O/wQCx6y+dZbuPnj3XgnlU3puFjaIPLJAU9Mws6Xqek198456l1HhApxDFyiDb
 kajbaifVyAG1j1Uk/y0JMpJQtoWsPWXvTmeihQ1V4jnzHyVDV5dElMEfedlREaLEr2m5Qen8sfr
 nIpA7Kff2wxxAF062+CMImeVlomhFH79QLGhlkfG8LbKHb4lmoootgAA94Pjzf00bIF6XIyQ4+P
 BqPF+1iO4ZbasUbv1Lw8vpA7KpY4bQQ7e1fZ0DR/ZCoNOUwvxC0r1Ox30sEjyFMPYmnetFMYeAR
 ZKp+99TrGpmnrH0s2TTjVZURGE5EnMjblvZyX7lLvU5KAahsE1SvDaO+DE6wTfSXcLwtrktU
X-Proofpoint-ORIG-GUID: 4iwW72XErSwsqKE1ciJYqNdFWkGhwEpp
X-Authority-Analysis: v=2.4 cv=Qope3Uyd c=1 sm=1 tr=0 ts=68178e55 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=JfrnYn6hAAAA:8 a=COk6AnOGAAAA:8 a=cI0x3iWxgyh4Hys7y2EA:9
 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22 a=1CNFftbPRP8L7MoqJWF3:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 4iwW72XErSwsqKE1ciJYqNdFWkGhwEpp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-04_06,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 adultscore=0 clxscore=1015
 malwarescore=0 bulkscore=0 suspectscore=0 impostorscore=0 phishscore=0
 mlxlogscore=999 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505040149

On Sun, May 04, 2025 at 06:37:41PM +0300, Dmitry Baryshkov wrote:
> On Sat, May 03, 2025 at 09:54:35PM +0530, Nitin Rawat wrote:
> > Rename qmp_ufs_disable to qmp_ufs_power_off to better represent its
> > functionality. Additionally, move the qmp_ufs_exit() call inside
> > qmp_ufs_power_off to preserve the functionality of .power_off.
> > 
> > There is no functional change.
> > 
> > Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
> > ---
> >  drivers/phy/qualcomm/phy-qcom-qmp-ufs.c | 30 +++++++++----------------
> >  1 file changed, 11 insertions(+), 19 deletions(-)
> > 
> > diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
> > index 94095393148c..c501223fc5f9 100644
> > --- a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
> > +++ b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
> > @@ -1835,6 +1835,15 @@ static int qmp_ufs_phy_calibrate(struct phy *phy)
> >  	return 0;
> >  }
> > 
> > +static int qmp_ufs_exit(struct phy *phy)
> > +{
> > +	struct qmp_ufs *qmp = phy_get_drvdata(phy);
> > +
> > +	qmp_ufs_com_exit(qmp);
> 
> Just inline it, unless you have any other plans.

I mean, inline a call to qmp_ufs_com_exit() into qmp_ufs_power_off().

> 
> > +
> > +	return 0;
> > +}
> > +
> >  static int qmp_ufs_power_off(struct phy *phy)
> >  {
> >  	struct qmp_ufs *qmp = phy_get_drvdata(phy);
> > @@ -1851,28 +1860,11 @@ static int qmp_ufs_power_off(struct phy *phy)
> >  	qphy_clrbits(qmp->pcs, cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL],
> >  			SW_PWRDN);
> > 
> > -	return 0;
> > -}
> > -
> > -static int qmp_ufs_exit(struct phy *phy)
> > -{
> > -	struct qmp_ufs *qmp = phy_get_drvdata(phy);
> > -
> > -	qmp_ufs_com_exit(qmp);
> > +	qmp_ufs_exit(phy);
> > 
> >  	return 0;
> >  }
> > 
> > -static int qmp_ufs_disable(struct phy *phy)
> > -{
> > -	int ret;
> > -
> > -	ret = qmp_ufs_power_off(phy);
> > -	if (ret)
> > -		return ret;
> > -	return qmp_ufs_exit(phy);
> > -}
> > -
> >  static int qmp_ufs_set_mode(struct phy *phy, enum phy_mode mode, int submode)
> >  {
> >  	struct qmp_ufs *qmp = phy_get_drvdata(phy);
> > @@ -1921,7 +1913,7 @@ static int qmp_ufs_phy_init(struct phy *phy)
> >  static const struct phy_ops qcom_qmp_ufs_phy_ops = {
> >  	.init		= qmp_ufs_phy_init,
> >  	.power_on	= qmp_ufs_power_on,
> > -	.power_off	= qmp_ufs_disable,
> > +	.power_off	= qmp_ufs_power_off,
> >  	.calibrate	= qmp_ufs_phy_calibrate,
> >  	.set_mode	= qmp_ufs_set_mode,
> >  	.owner		= THIS_MODULE,
> > --
> > 2.48.1
> > 
> 
> -- 
> With best wishes
> Dmitry
> 
> -- 
> linux-phy mailing list
> linux-phy@lists.infradead.org
> https://lists.infradead.org/mailman/listinfo/linux-phy

-- 
With best wishes
Dmitry

