Return-Path: <linux-arm-msm+bounces-82843-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 018B8C790DE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 13:47:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 52BAD354ECA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 12:47:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FEB22472BB;
	Fri, 21 Nov 2025 12:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HAXUntXg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eGlUMxUh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 756A42459C6
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 12:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763729231; cv=none; b=TC0dQPSRwaH3LVs5tGl/P744LEGCzvFlJIv44UEBNTceaD4/QfcKfH3cgZmygiTvPvajBH6Ia1o4KQN1pf6EUm+R9iC6mUZXiMKGi85eh7Ve+kzr/W/Ne/3i4Vjwu15sxOsqBdSN+qsEBnSaKPDGof0tbQlfl8GEsulQFcThazw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763729231; c=relaxed/simple;
	bh=h4WOJ62pfL6IHlZQtCDyGCDMDpVkECvsZ4GVjHlxSY0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HcPpajAXwNRpuvagC6gaP85mEo+G5JfOlLgAg93PtSqOOQ9VIoH8isS0marlYPctBV5wENNSHxhFcSnOA1L1Cn9+/b0RsFBOCbi2dprl+st6lC4a3EEUe/k/o8xba086nMdADnDyA6E05/fwIatL1mMPqp/MJlk62eHg5eSzIaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HAXUntXg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eGlUMxUh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ALB49UC3911309
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 12:47:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OvmALCvQ5ptZCSB2+jI5QTgm/ZHNVohRruEciGYDcd4=; b=HAXUntXgZq04+sEg
	khidx5SQO1ch/IyDR0NYVIwKpj2owzOgB52QIBea3j1J6gTpCKzvPFOyJvL94KAU
	2wlG2p7d6H0EbmR+5XaGxfMbCOKWakQ8CoHh0PPELgxQoPkSsqskTzkwZAVRmaOM
	nMBaIDqTpYMU45yZdrBI+j4OPCLqxbatAZUN2CtBYSJ+fJq8ZnhRt+5Wib3QoRl3
	rPP5Y4JZsxCIY2y8D+gvxy/O5pXS76FDRy7cae+GiuiyF3XG4N1sSZ9HKgSq3UyG
	pD+pd4kJjDHQf5/iByEZsd7CNDxXXUbb1gxxQh1i6PQlG6zSm7hyDRFlBKSe6cmu
	hPDODQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ajpvsg98n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 12:47:08 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b2de6600c0so662168385a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 04:47:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763729226; x=1764334026; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OvmALCvQ5ptZCSB2+jI5QTgm/ZHNVohRruEciGYDcd4=;
        b=eGlUMxUhv1Ab9aX53e8cutLH6kOgPHxqk23vRzFc5nwHhxFqmLvIscWXAadTk+Wqnh
         X1nLEBv/T2Q7RP1sl1YD7gCbOzL0r39khzkBCW9r8Rm9nBEq81BLhTHGKqsnZ8I5W+X8
         hcO/auvy05PHPz+gLPcXtjVm7dbyQNqWqUFG4Zevp7Ag0EiAjnwxdZjhAW2JiVQiUa+y
         YMiyagvljj+jH/9ikpmf37gp1CyJ+xZDh6F2gpU2ef6rujv/llgTOHEwv1265rM0z7WB
         Y1fwdaUN7I4dFa38lyBRUoRjvGZzY4pW3Tb1y3o6Hq9SI/8hOgH1fQDHpQKNx0gMsTi0
         3wRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763729226; x=1764334026;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OvmALCvQ5ptZCSB2+jI5QTgm/ZHNVohRruEciGYDcd4=;
        b=AhQkwgXiWT7e3tCbI9zuM1dZZje7sBt0+YMoNDUeSB0V7NYjl9FXCmY8vOWOFjfZWh
         joF15kVUOG2BjaVc7/3T8ruySxbIAZo/t6Zj8hZisRzKhRa+X5xYjzwTSlU97lPfZB/2
         1+eNKKI01NmCUVI36/8cVelBiF9x6xCU99YvLfkLHK9/qCUssyoYKQKJanXSEA4l9HH0
         qM2c6EGseTsapm5Y6gzKQkksvTZRvqvsifIjbBJ8kWK/E2KzUwXmNBk/RCI004KrwgN8
         ggFrFOl5kTs8zcMY+49yHqcmG0X+2nPy2LyLEnpcTCSKEwIvingkOV9IbeII8/CccOsO
         gYXQ==
X-Forwarded-Encrypted: i=1; AJvYcCXke68iq7qxzePdPZGh/8D4zdBpHfoQ5LNciZemDjqP4AbwcNl9t/cWj+w3q8mPkbFxQy2VWXP3vi1YMmQr@vger.kernel.org
X-Gm-Message-State: AOJu0YyejStKbWq0SHeEtBO+8B+UQNmHJBWX1+C1jazm4CcpOWRtM685
	gxB+555AAUZLOZuKHKC0qLozAzb+ZTPPGXsZ6reZnvh3pgjgNiT65T5HseeNMt7LG7SINFAYcsa
	7u39ms3xQMHLT4elW3LCSzUOYKy4qiYTbb3TGZfq8ceL3HF/8A85vkftbnHLSqoOduq5RQX3QXn
	8x0Sx7OoC85e8hsmPrc61y+oswr+EJuM206t6pgfS1RRw9bsm1U7yCgg==
X-Gm-Gg: ASbGnctPw2wIrpr9z6EZsbHRhU8F9CdXNdmxibZFH8I4SRM5gYf+EV1Uq+Ggo4J1oNX
	X+anp1mPyFAXySM727hxCO71YjXYfzYFWnKbOtEzhnvJD5APwnwv9sd9TU/j4CGrJNDRJ94WWyG
	Vdv33jV0q+Rt5TF7YGPNGrbuEp5PjKVe9FznbzNuYlES6u0vYbyqC/x5JAZ76i84eHO6Lard9Ak
	ccovwyBgFv+/AEJ52QyUucNOew=
X-Received: by 2002:a05:620a:4412:b0:8b2:f269:f8a1 with SMTP id af79cd13be357-8b33d468fdcmr219877185a.71.1763729226262;
        Fri, 21 Nov 2025 04:47:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHWPiCIgHWVQUiYgEZLxcTEc4IYShOjsf4gp1DesTemBJOKI/fXv3roTF9QbBQJ6o5Zq2D4RL0UGbl9ep845Ns=
X-Received: by 2002:a05:620a:4412:b0:8b2:f269:f8a1 with SMTP id
 af79cd13be357-8b33d468fdcmr219875085a.71.1763729225849; Fri, 21 Nov 2025
 04:47:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251119105615.48295-1-slark_xiao@163.com> <20251119105615.48295-3-slark_xiao@163.com>
In-Reply-To: <20251119105615.48295-3-slark_xiao@163.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 21 Nov 2025 13:46:54 +0100
X-Gm-Features: AWmQ_bmuI9sNPf86QyN3uWHpPrHgwmugGLDFCp_d8rNLY1v-hjk-kGSjK1o7rSc
Message-ID: <CAFEp6-23je6WC0ocMP7jXUtPGfeG9_LpY+1N-oLcSTOmqQCL2w@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] net: wwan: mhi: Add network support for Foxconn T99W760
To: Slark Xiao <slark_xiao@163.com>
Cc: mani@kernel.org, ryazanov.s.a@gmail.com, johannes@sipsolutions.net,
        andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: sJ8buLbqbeicIiphaxAFg5UU9UOoCo8b
X-Proofpoint-ORIG-GUID: sJ8buLbqbeicIiphaxAFg5UU9UOoCo8b
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIxMDA5NSBTYWx0ZWRfX71bfKQvc1EA1
 hgBjil3ptrc4t4FAd+/nlW4rmb8wi0WqWXevcYyyV0rdUVL3xUrg1FoHAVBY9jSndZx49DTtGXi
 aUMkiBTLBTubWG1CIj//O+PK425P+AgGOV7u6WyPs3FZ0zP2q/9CqDCMlPRJKcXJKWTNTDDJje3
 0zy4OBQaismY0n8qAmUJgcCdHjJwwbDwauHyiCvuBCkK0yV0RdQsprD4HoFXrxl2b5LDdvJwXk4
 svfbN2C2cjh0R9Okq/X0yJihuahuMcGF+wX5YTrjiBMK5wmk9ZjdZEGDVuSagAm2/LTe2o2D5QG
 BYB3WIFUwECpmwdB9s2vBWpZlOxWonzr+FsUW1SJG/bd2GGKCFlXjgssZkK10iyS2YONMywZbNS
 gsS/cBL8wRyH/epQcZZsrNcflX7A0w==
X-Authority-Analysis: v=2.4 cv=MqFfKmae c=1 sm=1 tr=0 ts=69205f4c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Byx-y9mGAAAA:8 a=EUspDBNiAAAA:8
 a=laIMyccDeTmSpVvBuxYA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_03,2025-11-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015 spamscore=0
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511210095

On Wed, Nov 19, 2025 at 11:57=E2=80=AFAM Slark Xiao <slark_xiao@163.com> wr=
ote:
>
> T99W760 is designed based on Qualcomm SDX35 chip. It use similar
> architechture with SDX72/SDX75 chip. So we need to assign initial
> link id for this device to make sure network available.
>
> Signed-off-by: Slark Xiao <slark_xiao@163.com>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
>  drivers/net/wwan/mhi_wwan_mbim.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/net/wwan/mhi_wwan_mbim.c b/drivers/net/wwan/mhi_wwan=
_mbim.c
> index c814fbd756a1..a142af59a91f 100644
> --- a/drivers/net/wwan/mhi_wwan_mbim.c
> +++ b/drivers/net/wwan/mhi_wwan_mbim.c
> @@ -98,7 +98,8 @@ static struct mhi_mbim_link *mhi_mbim_get_link_rcu(stru=
ct mhi_mbim_context *mbim
>  static int mhi_mbim_get_link_mux_id(struct mhi_controller *cntrl)
>  {
>         if (strcmp(cntrl->name, "foxconn-dw5934e") =3D=3D 0 ||
> -           strcmp(cntrl->name, "foxconn-t99w515") =3D=3D 0)
> +           strcmp(cntrl->name, "foxconn-t99w515") =3D=3D 0 ||
> +           strcmp(cntrl->name, "foxconn-t99w760") =3D=3D 0)
>                 return WDS_BIND_MUX_DATA_PORT_MUX_ID;
>
>         return 0;
> --
> 2.25.1
>

