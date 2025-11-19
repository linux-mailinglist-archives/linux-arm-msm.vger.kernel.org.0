Return-Path: <linux-arm-msm+bounces-82492-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 70C25C6EBDB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 14:12:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sea.lore.kernel.org (Postfix) with ESMTPS id 34468289A9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 13:12:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54D983612E5;
	Wed, 19 Nov 2025 13:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aufVFN8K";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QG1bur70"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C9F93612ED
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 13:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763557730; cv=none; b=YOWoUzLWZS7eciyscNH/MHufL5H4NZcuL43BfS1RPMtdF06nyRSohg65zj7X5KuG26yALWqp5JULwCtLzXWpTRwpYnkrYn/uULYH214yN+5zMnD8Iu+ge+TekdQDE9SnI5ZL8flLp/EtfOhRMllwEAYyNc6i2Vpb/L+iHXzp1hY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763557730; c=relaxed/simple;
	bh=zfEQUt4DhWAUXc5x6ce3fvEtypuCBnBXH7OVSLBJQLc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iY501ZFMxGIlhf6YxfJ8+fswPBrYt3wBTIhegsrovTkTUXvQxXHeonogq7hrDRZ2IijLrNqocA76ewF/M3GW8MmB2njAS3ki2WdtKXEynK6sjhEw7WvB298BMoHwcYGomLhU/QM4H5LPyLQw7ML1xqI7ZbpK0j8gNk/dmtV+v9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aufVFN8K; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QG1bur70; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AJCH5QM1030389
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 13:08:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	l9lECUAFdYVI6sCIVSOz3LRlNh/O8By86XnvozCDqms=; b=aufVFN8KDVdSv69a
	hRT8GTNwJnTqUhoUVN0GUd1eHfFPuDuEXpteVMBRqQmbkLV+9JhrVq/4f3PPqsQK
	spfIbRLn0RBJyWlFxIOKhGcaoRy3quZ/Ixko412pkSEOsaZmMOa2gY9hxHKyNwLd
	NnQO77kYkz+sasGlbwDvbIZ6hiHAfv0Drj/6dVhTDG89cO21LJ8N8lACunR8cW02
	RUlJvAwTWm9LW8xqVGt4tq0fZGsAN3FJsptioNFnfTmpfKS1belXodN/SSvBorDJ
	9NI/1SpAeY0Hc8QAegSbTv+eqUsyDUa4jZZjV0nxiXmVEY+ObCpM6Mk6y7tJESgn
	ZWXUfQ==
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com [209.85.166.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ah7ansdha-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 13:08:47 +0000 (GMT)
Received: by mail-io1-f69.google.com with SMTP id ca18e2360f4ac-9489a3f6e3dso1031770939f.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 05:08:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763557726; x=1764162526; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l9lECUAFdYVI6sCIVSOz3LRlNh/O8By86XnvozCDqms=;
        b=QG1bur70EJbE8Miaf653J0h0J66izu+6gpxuJV+KQKYIJnXjp0PW6Bopd2BO/oSQWt
         lUUB/HIE0QbUbusWw+XL6KxaB4d/4kvtBKFJJu4Em3yWc+SPf9q5PXkqOXXTuqvicuZp
         gi9Zm2Q1NR7RzlVmD0s+jqKBKZtpGo0phWk9f06lJKQYP5B406ShdxTtDbbKSOCLJlhl
         tzxObncoVPt1TmDUEkp7KvtldftPVSdO1Sb/BbWx0ifhzKalvZVxhYTD6McWq0K2Gzy+
         4UxJVvPYndIcVYOu3UjqsABLUDkKXRRmw2u/32c9mYW7p2oppeTn/XMi4fxanot2fO9J
         pmag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763557726; x=1764162526;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=l9lECUAFdYVI6sCIVSOz3LRlNh/O8By86XnvozCDqms=;
        b=oNY8FONgMu2x8mDt5losqX8ct6JOuDXrUnJV0dQy4QjqY3zu+BG8vZpw0tTKtcNV1r
         11+ykdsPhsunnnD5Y0Hcr8l7dN99s0LJDyTxCF2p+ocimZ7RckPsKnDB0rTGBGDEFW6F
         /bcHejOTpJzdmLOy3s8oXyIo1clowRvz14ba6QolCDWC0UX1P1qCsk8s8TVuDsUB0bnV
         /LSrMp743r+rDvozUbf1u4Zm+bPsCjNmMYXV3jQZRzyw0AVLIBR+2QcNLRSYKgz7TB70
         Zf4A6zhr/B4a6LpX06rurm7xYY7oxIm2rXv5IZDNOSFxERTc4Y58uO6nF8c05omBofYU
         kt2Q==
X-Forwarded-Encrypted: i=1; AJvYcCV0akhZk1yhhh+mcHhWyynMW0W+qC6silpthF7ZXGQBQgwWQvpVJQ6awSleuAODPLOPBzr0RnHrX4jRUXXn@vger.kernel.org
X-Gm-Message-State: AOJu0Yzm7WMj3tVuACMrgYPdnbNZDfymnWXWc2oqepamza0TvU8iXER1
	mTDFyAj9SYMUAefL1erEFi2R3qwZ7e+ovJk+HPCWr8/oAV9ridSDPYX7JLSxBElgIWobKQ6DJr7
	JTNlk42mI/2o3w74Cp6vTktlqqUzXasCcxfvMKmYF4iPhCZ39hqBc9KlFjE6qiBjj8biohigyxD
	CBTCkJC6d2cXhCzWH9BAerv1bw7bh9iYf6Y/J//kQcLeU=
X-Gm-Gg: ASbGncuOP7xffQVjqI5VaEGHSEhCtj4JE78Jxz1j73LqknQ3SjcPu1aOitlU3X5DMXw
	FU3WUgHl88B3yHgolZ6y8r3wJ7jRVHQzdufHe0oGyTSvUhKLPDk/R6ReFRoMlQvyGlAirKAqZiR
	IBErEojRzR2+2m93/9fv5eMUY6Uyzjt/gI3uCwTGit/NY0qVDfBpIft6BKHbJTXmrX4bFQ1oa/q
	14yGbb7gmveW0T9PrMIKkiFBWBj
X-Received: by 2002:a02:ac16:0:b0:57b:66fe:15ef with SMTP id 8926c6da1cb9f-5b7c9e0370cmr14450852173.19.1763557726452;
        Wed, 19 Nov 2025 05:08:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEY+j1dfzf8Batt7FHNQwSvu4wncs/IYd0ddz7VrhrJ0xKu+nxGk0DEyzi1ENK6CVZeNWF9cPj4TuK3qu0VzgI=
X-Received: by 2002:a02:ac16:0:b0:57b:66fe:15ef with SMTP id
 8926c6da1cb9f-5b7c9e0370cmr14450812173.19.1763557725952; Wed, 19 Nov 2025
 05:08:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251119105615.48295-1-slark_xiao@163.com> <20251119105615.48295-3-slark_xiao@163.com>
 <rrqgur5quuejtny576fzr65rtjhvhnprr746kuhgyn6a46jhct@dqstglnjwevx>
In-Reply-To: <rrqgur5quuejtny576fzr65rtjhvhnprr746kuhgyn6a46jhct@dqstglnjwevx>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 19 Nov 2025 14:08:33 +0100
X-Gm-Features: AWmQ_bkdfqVA1rkVLtELKfbA7SfWdvWWr7jj-_NBBRnuiF2JhyyUFR7jNOrf7ls
Message-ID: <CAFEp6-18EWK7WWhn4nA=j516pBo397qAWphX5Zt7xq1Hg1nVmw@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] net: wwan: mhi: Add network support for Foxconn T99W760
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Slark Xiao <slark_xiao@163.com>
Cc: mani@kernel.org, ryazanov.s.a@gmail.com, johannes@sipsolutions.net,
        andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE5MDEwNCBTYWx0ZWRfX03zZtMlGGnYu
 4pyKlOx4a8qdCrHTzFGlGy5HhlRhPUwcZPaFcBfHkg1KhEdrKKFCo84nYSSGxiqoMYZipt/fT41
 b34PRE0Ogyix2Gqf9gMBYJRqDyZ+Z0zh+qmfG9HpVh6+s9a/A7Sw2Jpj2b/VRvG5yTDOZ1RWtxU
 IvmOyknQzd4wZhjprAnTwxBarvqbmB6qaQL9eJCsc0mK0BBWV90dFu8wj2QiWnSNFjVoNHhWm9x
 tEQi0a5o5bED6MbT53Xgnv8UzSKgA0aY5Pfn+QRcJ5uwi+yb5LnvVyVUcuCsI/xoyHjCfKwQKzC
 0ouyFzfahXz1L5ghxLBkVvpX55126Ye2TAvJRfyynXXRczC4hMOmLLKwBHNx5yZIrOiYiF2iqLv
 RN9N+4jHgDuv6GnZU5qDNFHynXgJ0A==
X-Proofpoint-GUID: FzEg1k4gn5CVJJ78qSH1j8b5kSkNF9C1
X-Authority-Analysis: v=2.4 cv=a7k9NESF c=1 sm=1 tr=0 ts=691dc15f cx=c_pps
 a=7F85Ct0dzgNClt63SJIU8Q==:117 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=Byx-y9mGAAAA:8
 a=8dE3Wk8t88_o15qU7OwA:9 a=QEXdDO2ut3YA:10 a=LKR0efx6xuerLj5D82wC:22
X-Proofpoint-ORIG-GUID: FzEg1k4gn5CVJJ78qSH1j8b5kSkNF9C1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-19_04,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 phishscore=0 bulkscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511190104

On Wed, Nov 19, 2025 at 12:27=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Wed, Nov 19, 2025 at 06:56:15PM +0800, Slark Xiao wrote:
> > T99W760 is designed based on Qualcomm SDX35 chip. It use similar
> > architechture with SDX72/SDX75 chip. So we need to assign initial
> > link id for this device to make sure network available.
> >
> > Signed-off-by: Slark Xiao <slark_xiao@163.com>
> > ---
> >  drivers/net/wwan/mhi_wwan_mbim.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/net/wwan/mhi_wwan_mbim.c b/drivers/net/wwan/mhi_ww=
an_mbim.c
> > index c814fbd756a1..a142af59a91f 100644
> > --- a/drivers/net/wwan/mhi_wwan_mbim.c
> > +++ b/drivers/net/wwan/mhi_wwan_mbim.c
> > @@ -98,7 +98,8 @@ static struct mhi_mbim_link *mhi_mbim_get_link_rcu(st=
ruct mhi_mbim_context *mbim
> >  static int mhi_mbim_get_link_mux_id(struct mhi_controller *cntrl)
> >  {
> >       if (strcmp(cntrl->name, "foxconn-dw5934e") =3D=3D 0 ||
> > -         strcmp(cntrl->name, "foxconn-t99w515") =3D=3D 0)
> > +         strcmp(cntrl->name, "foxconn-t99w515") =3D=3D 0 ||
> > +         strcmp(cntrl->name, "foxconn-t99w760") =3D=3D 0)
>
> Can we replace this list of strinc comparisons with some kind of device
> data, being set in the mhi-pci-generic driver?

If we move this MBIM-specific information into mhi-pci-generic, we
should consider using a software node (e.g. via
device_add_software_node) so that these properties can be accessed
through the generic device-property API.

Regards,
Loic

