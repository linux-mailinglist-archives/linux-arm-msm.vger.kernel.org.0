Return-Path: <linux-arm-msm+bounces-75401-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 918C5BA68E0
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Sep 2025 08:21:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 215913BD0AF
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Sep 2025 06:21:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F224C1E260A;
	Sun, 28 Sep 2025 06:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WGj6IAzq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6070E17C91
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Sep 2025 06:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759040485; cv=none; b=SRfNps67tP9EUGicILT9GqxWME2dN3Rbc+SJ99FiW1j53Adre3HEtsAvdENKDP41ejhku0wq3P2XUm9RKsuvHIZTLPn6fJcYWU8dHlgwL2E+LAsT20GZP6/wbT5Mp1dR6y8zBbOlnT7sERbaQB/tNctzL78l3F6MCBhnsKztZlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759040485; c=relaxed/simple;
	bh=5OHe5/0FhoWVzct+TUfg4vXcEyHsUVbLc5oMj+KX8Wo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hj8WqXOU9XjC63Damza1z41HwKlIQR30EzD9ZGN1U6Bn2EynjdhKvls33GsIsEzscAv4Rzn/34DmFVEJnlHSDPGK+/PjJyqcwrrGmIFBmMVbf89MDuJbgv73OcWTN1YFWhC+ksOgwgBoVPe+L1x1VnZwGjrieh/6+H0CF5JDoOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WGj6IAzq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58S4ZTvL017528
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Sep 2025 06:21:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	adfQTxYAwt9QiAZ9Rv6g0WGJu0NUj5cU291wZUsO7k8=; b=WGj6IAzqvp90qEWO
	I9tmVSe7IkfqFlyg57z/vByC12a/8QPD4Sj05/hd5yi8zm7NhDwV7xB8yoRdn14H
	1wLDYJ9EWRC/WdoW0ReFi7ly8pFZ8r0SCfsmLDzLDSZ7SFgZImVfOsBJ+cgMd9Bg
	Gv6Lo/F+DoIcvCxYLoJzqtpE5Km5M/RILXV5/Eg/tHtXqwmi3onhgCC31sQiWn5x
	moZR+hbD9cUU9N7QI496KBMafP4p2Xcf3qSScRSQWYRH0y9LdiP2LHRAn+SeoohP
	ruXM98s8Mey2T5oNjQ139S3+T48mJ8c2CIUoDHE72p29s2duLx0zTbgnEUaZbIPo
	mCpI2A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e8a5t7qb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Sep 2025 06:21:23 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4df22892603so22881761cf.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 27 Sep 2025 23:21:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759040482; x=1759645282;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=adfQTxYAwt9QiAZ9Rv6g0WGJu0NUj5cU291wZUsO7k8=;
        b=JO1I4Y4pbWXNH6ZEDY3g/WdKr3vH735cBNMN2FhCsNW0LpaM9JB0G9Q6wtS2+NlM3B
         D6/ADe4E4rjv5AYR4I5681l5kRjjZUGEGY1EqUPuUysUFR/3i61SnVZ/oNtH3WMQr+7h
         aYwtCGFu+rLoyoHmAgwapPqH2K4AYsFmPZs0kJ986nO4wZP+ZHaxTv5g++TqN+EMZM0u
         pL7SAu5uj2v18YmOPDp4LB+o/ykIxdRw7nU4sznfyb8CT4LgETXdBrfivr7zzlphvKer
         WeqPv30MkHcBbvqag49jYqWjV5W9oWhKc8bJX3osBzO3f0/Ii70CloAuYz5pme2D4pNW
         rEwg==
X-Forwarded-Encrypted: i=1; AJvYcCVr+KKUuHJ0e6LNVouUMRFoUrt2cs1EP4d0tZ8g3spQ89+NoakCQ0NjQjkg2rWll4uIunJgZhLc1QP8ZCUd@vger.kernel.org
X-Gm-Message-State: AOJu0YzQkN5YtKiyU5uY6SWeTzhBNuXT7NYCQGzmS8Oyl6ZvzhUduhwz
	WY0aq2lEHud5ecRcUGPmgwO64lSaD6TvXHpc7j7EveWJa9nj72q7ZQqDAUZI3gMO090d80IwuKP
	PpRMYpDvBwM3a5nUFwBl0arFb+XeVOL/7AwSLUv5Bjjfwrs9F/qrT1NYCyDo9iRpCLwnT
X-Gm-Gg: ASbGncuIH5qEy0KmW4dzc13Be1SiPkaTbNRCYNmkF03epODXidO4GMJ+mNgk0xmd10o
	cxXJzVtSdVYYiZPym9PN5rVtuJCR1/syw9FWaNZgJ7g5yeqXOCRML8CcSEi3kT45lQIqYagsgnf
	MioWdfhaNK/EwlJLlede4S+PVUGG+Yy+91DmrVTFPf3MkHBvsFvLKIjb2zl0ktEw8LjBPDImnLX
	DhaI55QNmSlZpaqkHQ1NMH/QM+B/wSoCvOSeLAsdD/b5BXebGls38VmgjDakvzF0qFRFyjIwAo2
	wulgDPKhQtUKb5trmBZwnd0dTtOkQTZ0jl+/rZE8fU41D8rkcnSfRjYz//OTJHfD8w7XudXXphH
	Im3DA3nWiAwtXRN+GONeM3ui2/c05EvI0YlYCZLK1WTbsB+XmH6UF
X-Received: by 2002:a05:622a:4a87:b0:4cf:dc5c:8c79 with SMTP id d75a77b69052e-4da4c96578cmr195470511cf.60.1759040482264;
        Sat, 27 Sep 2025 23:21:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEUH+U6nzyTVSU0uK+jF8Y4GpmjG4m5FI0OpLeboi0DBVPoonLJpycaz0AY3CiU+ipqTQNiGw==
X-Received: by 2002:a05:622a:4a87:b0:4cf:dc5c:8c79 with SMTP id d75a77b69052e-4da4c96578cmr195470231cf.60.1759040481824;
        Sat, 27 Sep 2025 23:21:21 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58629e50c8bsm843606e87.79.2025.09.27.23.21.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Sep 2025 23:21:19 -0700 (PDT)
Date: Sun, 28 Sep 2025 09:21:17 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Christopher Obbard <christopher.obbard@linaro.org>
Cc: Hongyang Zhao <hongyang.zhao@thundersoft.com>,
        linux-arm-msm@vger.kernel.org, casey.connolly@linaro.org,
        loic.minier@oss.qualcomm.com, andersson@kernel.org,
        Roger Shimizu <rosh@debian.org>
Subject: Re: [PATCH v3] arm64: dts: qcom: rubikpi3: Add qcs6490-rubikpi3
 board dts
Message-ID: <tnllrh6qenygkodznwn66ktwu4bzi2xpecsq6kzdyi3a6lmjpf@si2aedcyzut7>
References: <20250924161120.27051-1-hongyang.zhao@thundersoft.com>
 <01817a7d053391c4eed6b78bc59455c60f6b3f3c.camel@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <01817a7d053391c4eed6b78bc59455c60f6b3f3c.camel@linaro.org>
X-Authority-Analysis: v=2.4 cv=RZKdyltv c=1 sm=1 tr=0 ts=68d8d3e3 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=Wdb1h0LgAAAA:8 a=xNf9USuDAAAA:8
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=E-g22v6uv236ufNf4DAA:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=j5gyrzqu0rbr1vhfHjzO:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: ERCSJsrjzOK0DrkPPmYlRJCkkMOwsBZv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAzMyBTYWx0ZWRfX5eVdBNmAcuIm
 C4SEWQUAQvaAQg72r50q9zRzQ1gR8opIs3mVglzCMMQQEjiY5m3ZlFAwW/m9tCljRz5Qk0PYJfw
 Mq1tRW0bXrD7WB3qDgS2cK7lkPOMD/sdg3IZiSTP6RzgDpYOS+YVZo9NeCBnSaujvEc7sQ2INPB
 8GScvFdj6qndubsgGE8qe+/PJUCrRe8hJDu4U5Z63nfcTmPYTeiqr79RcZLT9GV7SCWgNzLi1OH
 NkR+78G9Eo5v9qp6oPHSw32y2XHavZoSzUtdd1Zdw+au7dQsNfX9swBwHaD6InVs45iSxwoi8mc
 qTuastqVcDmSY52j2i9OYe1uK+/uJ5X5KZvhItHLjXH5EJwqk9dsVm27eNdSkmh1p/1Sd4iKIB1
 iS7G6kBiqhoi8a3/mq3IqlHoQDGyXw==
X-Proofpoint-ORIG-GUID: ERCSJsrjzOK0DrkPPmYlRJCkkMOwsBZv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-28_03,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 priorityscore=1501 adultscore=0 phishscore=0
 impostorscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270033

On Sat, Sep 27, 2025 at 02:57:41AM +0100, Christopher Obbard wrote:
> Hi Hongyang,
> 
> Thanks for the patch!
> 
> 
> On Thu, 2025-09-25 at 00:11 +0800, Hongyang Zhao wrote:
> > Add DTS for Thundercomm qcs6490-rubikpi3 board which uses
> > QCS6490 SoC.
> > This will add support for debug uart, usb-typec, wifi,
> > bluetooth, fan, m.2, i2c and uart on the 40-pin connector,
> > usb2.0, and some voltage regulators to the board.
> > 
> > Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
> > Reviewed-by: Roger Shimizu <rosh@debian.org>
> > Cc: Casey Connolly <casey.connolly@linaro.org>
> > Cc: Christopher Obbard <christopher.obbard@linaro.org>
> > Cc: Loic Minier V1<loic.minier@oss.qualcomm.com>
> > ---
> > Changes in v3:
> > - Rebase on linux-next/master
> > Changes in v2:
> > - Fix problems found when running device tree check.
> > - Enable USB2.0 interface.
> > 
> > v1 Link:
> > https://lore.kernel.org/linux-arm-msm/20250923064330.518784-1-hongyang.zhao@thundersoft.com/
> > 
> > Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
> > ---
> >  arch/arm64/boot/dts/qcom/Makefile             |    1 +
> >  .../dts/qcom/qcs6490-thundercomm-rubikpi3.dts | 1348
> 
> Would it not make sense to name this file dts/qcom/qcs6490-rubikpi3.dts
> ? It would then match the other devices which don't have a vendor
> prefix in the filename (e.g. RB3gen2).

They DTs don't have a vendor if the devices are produced by Qualcomm.
For all other devices the vendor is a part of the DT name.


-- 
With best wishes
Dmitry

