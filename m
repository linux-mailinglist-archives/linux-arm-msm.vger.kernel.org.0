Return-Path: <linux-arm-msm+bounces-109481-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iCwVItd7EWqHmgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109481-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 May 2026 12:05:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E1F1F5BE724
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 May 2026 12:05:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 921A4301465F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 May 2026 10:05:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B38F340A76;
	Sat, 23 May 2026 10:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ggZSGHPV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IUOyR/jb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDB87356767
	for <linux-arm-msm@vger.kernel.org>; Sat, 23 May 2026 10:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779530706; cv=none; b=JXakxEfZ2n7smj9a9fVLH4+hWk316fa/HWK4zAi5laPO3bG06iXjCJnY5Zdm5FWtmLKEFTJ8zFLznksqqL54joFXPABMF2xepW7P4rJfCI5D0bBup0gmNh0locEczmj0aqih0MNxeq3DLAUXSfkvTl1CyHYAl3tECvO8unVWUvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779530706; c=relaxed/simple;
	bh=V2304hPhCLaEINeRbW3svJXgId+CqxWIXKfD2dxHamU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jLFClwsk8U5oDr+2Wm/rOME/4uLX1eRrqNQZ/S/qL6LWMmzhYYjTHptx+8Tmzkv6dunh1VvBPBfLyTJtuBcoHay2k29Rl9itrUb0Mr2/pHqb+hzmIiO41FSY+G3iwDKHY/aiF2kK8VeoGP8Nb3Obx4yV1MIM2ptc2MZ9ea6PkSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ggZSGHPV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IUOyR/jb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64N4eQdV1086546
	for <linux-arm-msm@vger.kernel.org>; Sat, 23 May 2026 10:05:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Q6snCAeBxTChm0m7Qo2dMFyc
	2TEwUXTAwg/b0rMQwwE=; b=ggZSGHPVRBPDMztoPjqLNzgFvF0UUE4TDgrCJCN6
	s4iqBCwZ8+NwYm6OEL6YU65wSUlgiYVGvocB6Ivn+g8Ip5iR2cJI9gLYBLbwU+7z
	JxXUNB2k0ldcXczpyWBkTFZFhYfYJF13SzC847CgeBGc0lUkzORe1VPX0HNr7CGF
	f02P2PCAZBvJbkPIwBMZNeXR3ykm2WDzJLnEPg47kTCLQxOy6HjxgVMM+Zc+kyrJ
	ShXLu7h5qYiDq5Ark+UTPh56rfsazMtqRAGn1hwBK2GZD0ccs23utthRRPfPBDFJ
	C0YLnczWsoWVeKv3yJU5Kx27NXgUjxu73T0uaUfea7wDAg==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb5djggqe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 23 May 2026 10:05:03 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-63309595daeso13144853137.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 23 May 2026 03:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779530703; x=1780135503; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Q6snCAeBxTChm0m7Qo2dMFyc2TEwUXTAwg/b0rMQwwE=;
        b=IUOyR/jbOVBzjYGeGbtbd5eL3nBXxei5ER6xvpFJdq20ZyW7UIOfuSzuPUHE0a3EE3
         2Gl0kfA+hDqG07RQ29tgar5T+6ahEILXOKmDMNXvXAX5jcBgAm+hbAE/TiT4pf/8SCCX
         ta22GQ1Iw5ecRMf+paX7m++2AAHc8Urzv2Xm1V8NAFYoxevbJYbgvvNaOeprd9sIbY+x
         13YgVPx64FZ8utOjWUz96jLSlgi/SenpT/Hg6SH91hvsSsK+DEznrWxgHvxOWb3PS+Av
         GeTjs5aDx4dHNyOxjbOp+u/eYJeYxgl5mzSQcrsUjsS4IQQ8QvAw38X7fOLhWMUMR9Hd
         U4Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779530703; x=1780135503;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q6snCAeBxTChm0m7Qo2dMFyc2TEwUXTAwg/b0rMQwwE=;
        b=k/3POwTP4jxi8nC/8PEpXvWopeqF15izfeGP4PmH2a/9K3MRy/Ew0le0CW/e/sqEKH
         6RTTcwYVmCJ8mwa4fW9oP4OcFht/xwH9ypRjD3o1+ROL9u13HhaGSlrXJ2g+lGMn3C2R
         bmwpsXDvVBRgfGQxdwW4n5ut89xGtWx5NCLoLYkiI28TqP4sss5/2OQM0OxQn+Ta95dn
         imxN28Xp90pWzHCjiCLSDqgfx9ydFUAC6yTgfkRM8gZ+W6reqgkzaeiI5efjjs9955JS
         VS29iLmGJWmruwUJ+OJj1rTAhEwL85uwXJ0gWIeXlZAPNHYG3dEUXojpUwpWsrKVdEkZ
         WlsA==
X-Forwarded-Encrypted: i=1; AFNElJ/7xCp1Zu0IJkoGvQTbmPnkI4xddvRmZ0Xbqf0MYkT1SemM6DTaJ6K+blKF7ibPoWf48hDnlLp0barYlw8N@vger.kernel.org
X-Gm-Message-State: AOJu0YyHTMM+ULcB9DvDKmrCB3E0PdZQAioMsABmx8+OSnLwa7eJjagk
	/8ZcCJxP8WAUTkw9kzTGAlz83h+ybNh0n2OZXTqaHmxoYuYq82ulYYw6k7CJdC6ak6LTVMnGxBR
	XciU83gBGLnNhlG79O5W8ZuOOFezsrvGANlV9ops/B6JtmR5D1J2eEl295dnNmgRTh9YjU8ZGUl
	x/
X-Gm-Gg: Acq92OFPU9+lnjw5lW3JJbaqNd9F5FAfJHrY2G/JrlRJla/UUIq2HOgYtegh6hMr+ZQ
	uwAntS6PxUrO/hizjiRYfif3UnuUT67jIfX2hDYg9Hj7ubVeViYtAt0MlJrlenNjjlOE3S/DS9o
	L0RlSxPmcCCu+H7KRh75EW0FT1TamSAPi4lx7gmW3GM0ImtYDaWGTpMjtLr5OAqSkclOHmmyVC1
	cgzyeSnEBX/2EMy1+f3Tnd0XpJ6mgFOVOyE0PVz0EuQFQe9YmYWanM91iAxd6EH71QERcfGR0cY
	8PD1Lm43oOMNaHzy8nGk4Eoei+he/IpU0KeMwHRi1iy+kmSRxZx+Jjs/qXQgd20otrSYo9f9TvL
	G4nJrZ4nz6X++hTkaaPracV28y6+yU4oesGE+6XyQXJVB2BxEJCml/hvpR3umH3k0thjKSQ3UX7
	VvGu7TPBVvQl2eeHecz/8JZdLrUtbwr0W13EA=
X-Received: by 2002:a05:6102:4bc5:b0:631:ec2d:12b2 with SMTP id ada2fe7eead31-67c7cfda10cmr3919345137.1.1779530702812;
        Sat, 23 May 2026 03:05:02 -0700 (PDT)
X-Received: by 2002:a05:6102:4bc5:b0:631:ec2d:12b2 with SMTP id ada2fe7eead31-67c7cfda10cmr3919338137.1.1779530702402;
        Sat, 23 May 2026 03:05:02 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa32cbabd1sm1024783e87.34.2026.05.23.03.04.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 May 2026 03:05:01 -0700 (PDT)
Date: Sat, 23 May 2026 13:04:57 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Imran Shaik <imran.shaik@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] clk: qcom: Add support for Display Clock Controller
 on Shikra
Message-ID: <xuynixonurezmfvmqqshobbowknjjsgin3qx3z2omsk2ffzsry@q5toxb47ahz3>
References: <20260513-shikra-dispcc-gpucc-v1-0-5fd673146ab2@oss.qualcomm.com>
 <20260513-shikra-dispcc-gpucc-v1-3-5fd673146ab2@oss.qualcomm.com>
 <n4wgnno2td3xmdsgwadvdtvr4ncitzio3ufufg5bp7wnga4ouw@mj76764e3uus>
 <dt5j7khzvgoj5qdrnfoi6ssye23jve5gjta5qx2ubuvufjzr2w@puacv5jgosmb>
 <1cf064d0-14b9-489f-964f-614aeed4fcbd@oss.qualcomm.com>
 <qg2n6pwjcoz7262eylept4mec2l74h2owfbhjykfxap6qwgzuq@oawiwgok4hhi>
 <1c0bb8ff-eaca-4779-9b2f-4d564abd8670@oss.qualcomm.com>
 <dv5rw3gkmy7evlv3bm5ryewy6ppojxgcklamqmc3x567isomtx@3oonu5gtzwq6>
 <143e095c-471b-4cd7-9395-1fa06fa50625@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <143e095c-471b-4cd7-9395-1fa06fa50625@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: G_OKil5rcdaP7HBUeVXpp4mDCEG8CewD
X-Proofpoint-GUID: G_OKil5rcdaP7HBUeVXpp4mDCEG8CewD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIzMDEwMCBTYWx0ZWRfX78QirClEWCNg
 xTIsvCxDkoxjSBO3xYLuWszhYfdisQ6w5CJoOd5BiO0/wqhRIYAU84s4KGIdJobY+jHMiGyHltO
 1ZImpSJ4di2dVPdwxttpuVwWkZqP8g+F/KOD0T+xI1qWINV0NbWdC53rAbLWzGLyCC7uXwenPhu
 +WItz6Bws+w6bmxmGy/LqVGM6Gi2we1io6ckpstFh+AjWNh46413Zq1nweX69vm/e4MeeN6XxlT
 bJdPqFfxa6cE6xXEL+dY9mEY3ZVEC3Pn41FFesDzbIhTvNVL4Pvkk+qGMPjrFIIWxHyNeYM7kM9
 2mDuuNzwSgoOfqruiTso0A1d0OH9hX0qRPG0b27ylDlsQ4V1JGf63fJ+KxEGQTV5uaRduxjDnjM
 oRFDMJnL+qXmNLiOSJZGShtQMvlNx7+SigBBuJo4sue80WZDIiu+AzRCxYZAF+FC3wMws6R3JZz
 NWTsR0qHBPDUvfOgqug==
X-Authority-Analysis: v=2.4 cv=Q8ziJY2a c=1 sm=1 tr=0 ts=6a117bcf cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=xc8VvEWKhJEnYHvCR70A:9 a=CjuIK1q_8ugA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-23_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 suspectscore=0 bulkscore=0 adultscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605230100
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109481-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E1F1F5BE724
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, May 22, 2026 at 02:39:01PM +0530, Imran Shaik wrote:
> 
> 
> On 20-05-2026 09:59 pm, Dmitry Baryshkov wrote:
> > On Tue, May 19, 2026 at 09:34:09AM +0530, Imran Shaik wrote:
> > > 
> > > 
> > > On 13-05-2026 08:38 pm, Dmitry Baryshkov wrote:
> > > > On Wed, May 13, 2026 at 04:51:03PM +0200, Konrad Dybcio wrote:
> > > > > On 5/13/26 4:06 PM, Dmitry Baryshkov wrote:
> > > > > > On Wed, May 13, 2026 at 05:01:16PM +0300, Dmitry Baryshkov wrote:
> > > > > > > On Wed, May 13, 2026 at 07:10:38PM +0530, Imran Shaik wrote:
> > > > > > > > Add a driver for the Display clock controller on Qualcomm Shikra SoC.
> > > > > > > > 
> > > > > > > > Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> > > > > > > > ---
> > > > > > > >    drivers/clk/qcom/Kconfig         |  10 +
> > > > > > > >    drivers/clk/qcom/Makefile        |   1 +
> > > > > > > >    drivers/clk/qcom/dispcc-shikra.c | 565 +++++++++++++++++++++++++++++++++++++++
> > > > > > > >    3 files changed, 576 insertions(+)
> > > > > > > > 
> > > > > > > 
> > > > > > > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > > > > > 
> > > > > > After comparing the files...
> > > > > > 
> > > > > > Can we use dispcc-qcm2290.c instead? It uses clock-names instead of
> > > > > > clock-indices, but I think it should be fine to use clock-names as a
> > > > > > one-off.
> > > > > 
> > > > > Or we can convert it to use indices, since those are stable for agatti
> > > > > too - the names would remain in the binding, just unused by the driver
> > > > 
> > > > Either is fine for me.
> > > > 
> > > 
> > > Hi,
> > > 
> > > In Agatti, apart from the clock-names difference, I see that the AHB/XO
> > > clocks are not handled as always-on via the probe and instead rely on pm_clk
> > 
> > There is no pm_clk handling in Agatti driver.
> > 
> > > style handling, whereas Shikra follows the newer pattern by marking required
> > > CBCRs as critical during probe. I think that attempting to modify this
> > > approach into Agatti may introduce unnecessary complexity.
> > 
> > Well, you can start by explaining what caused the difference and the
> > result of those differences.
> > 
> > > 
> > > And the Agatti DISPCC doesn't have the DT_DSI1 bindings exposed, and
> > > updating this might break the ABI with respect to bindings, and DT.
> > 
> > You can add Shikra-specific bindings. See how it's handled for other
> > dispcc drivers.
> > 
> > > Given these and considering that Agatti is already stable, keeping the
> > > Shikra as separate GPUCC/DISPCC drivers is better to avoid the risk of
> > > regressions and complexity.
> > 
> > I think you've provided arguments for merging two drivers. It would
> > allow us to modernize Agatti driver and also to make sure that both
> > platforms use the well-tested code pattern.
> > 
> 
> Sure Dmitry, but we would like to proceed with Shikra as-is now since it
> already follows the latest upstream conventions, and will handle Agatti
> modernization as a follow-up series to align and reuse Shikra drivers.

Having two drivers for the (almost) same hw is a bad idea. Please either
refresh Agatti driver to follow the conventions and then add Shikra
support or add Shikra into the existing driver and then update it to
follow the standards. "we would like to proceed" is not a technical
argument, it's you trying to override the review for the managerial
reasons, which don't apply upstream.

-- 
With best wishes
Dmitry

