Return-Path: <linux-arm-msm+bounces-60024-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A747EACA8D9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Jun 2025 07:17:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 57A79178AE2
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Jun 2025 05:17:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7679156F5D;
	Mon,  2 Jun 2025 05:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GP9bYpvp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2422342C0B
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Jun 2025 05:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748841429; cv=none; b=Loy+RCeqhu6L9mQ8QlYpwlITfyHWbFM6oaXnEa9kSuygEg6rCDSt7685zO0Qh6ZdcrXa/3nWurm7vxuw6HgSJj5YYzdd9bPQmBzkGCN5l1XW+bwfMCoJXhgqVNkFLENgAhnGVdGWE7wR6VV5oe2tVBREDnRvwaHfviJ+1M7TZlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748841429; c=relaxed/simple;
	bh=QlgZisWVY17SLtoiXdf351YXoW5eO2YEIBQ2EQVI5BE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eT3C9Jetmld5kRhn3qTQk4FLWknsclqC8p0xtFKUrQbReLdh9GAsTuUWs8wskinvTiBIcjyfNQVZlNk87xEQ6PJJ05UCPlXmfmtrZSD8XtZJ7CUO0unCdqBZ0ZmJQhDD09c/et/2ReM0dlXedwukfCEwHH+ns0dY0/eXdnNywZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GP9bYpvp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 551Mupva011009
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Jun 2025 05:17:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=BcvF3wu0+glYxRvQURwwkyPb
	Iw+40g+dQPFaEyxFw88=; b=GP9bYpvpahtE5IBqlgEbKiOhXg6THipkPi4Sa5D2
	SDZd1Ulu6vmJUpASjAQBAffcirieEVAqMA5mze5s3AHyEfOWMQ8K1OuOUMnKqacP
	F2JWvLk7F2DwE5WPOmhf1PW9G7vPGgDGjAbDPqPbaXh3Zy/as4cENeh1CW32oAkh
	RjFVpzP3HjJAdDEcoXLmmOG9Sq5ICWR3sjOXHv5EMs/Z5f0JgUA5LDniHTtk21PX
	tgbI6FTDQnejfSJPJOgp6TvFP2ZlpDZ5ysdfstweYpronhBD1wOGuIiWFuUonZO3
	iXmuM+5UbEyubg9ok1IjZwETRJCMSqMN4bbvr11Fio5UyA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46ytxm3dx5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Jun 2025 05:17:07 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-30ea0e890ccso3744398a91.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 01 Jun 2025 22:17:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748841426; x=1749446226;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BcvF3wu0+glYxRvQURwwkyPbIw+40g+dQPFaEyxFw88=;
        b=iR5mm71HTE4If9NTtG2mn+ZnEzDjd2UDsp070tCdaIDKm0IM1Khxsoptog3BGzSbUJ
         tosmY9sJQbHoWQ4840eMI+tBd8UldTstORFM62+OoYHrrkI/giV/Y+/PYe/qO4m56dcQ
         83q5y8vg9uEcIAwKLlyVtg5P16VkZuvnpi3P3vJVU0bxMTVcdXLq0a5xTfT47l0QQECE
         k2+cBpXuNuXa5ajxfvGBNrhLCVzPtev3dwQMOSyjPsvEM1J9e2h3CjM/VSnRmkLlqWLC
         mIKjnQDgwxWkdGHI5Xf6UqKyTcT1JPC0RL4YTBXzjOIK8B7pUKDtpyLod5zgJ3nOly7g
         giZQ==
X-Forwarded-Encrypted: i=1; AJvYcCUX12bkpIGZHo5KSiOgAE3YfA7NLQ1OOKjJ/rtE0zIS1ZUfgodd6BJZkWRkqzXTtfQBzj1IQwx54+vqwqI0@vger.kernel.org
X-Gm-Message-State: AOJu0YzF1N97dBj8/3zrAqWyD9T9l0vOHPCNP84etiNE2sKTLE9iP+mV
	XzzN2uvtchl5k5kw2W0TYcWEDiFjwDZPB8tiNsf99Fg8livdNl6S97rI+wFf05nLchWq8mqahSy
	X+PfmN3qqdkJbSZ8jyYyJeZalLSTgXbnvgQ1chTaXjE6HXC9r8u0W4KKlUff7TtWLyPJed4xV6F
	NBCahcODdRZuSQ65D7QmefzTc1W/4fZvApoZ07T2w7z2Xx2GjX5w3I/A==
X-Gm-Gg: ASbGncvLt2VOlW++aY5uF//GRMr6o5thj7+1lxMJ7Cnh7ciAw1JdSabgdrj+7IgsaoX
	k/EL1qDGSi4Sh9IrM/EuG51SM7umcGNmKTq1QuLbbUJePDFojc1n5xJ9ss8VG9hzTtE33
X-Received: by 2002:a17:90b:5828:b0:311:e8cc:4264 with SMTP id 98e67ed59e1d1-31250363513mr19184370a91.12.1748841426086;
        Sun, 01 Jun 2025 22:17:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHChfK7PzYEZQwIvqSMCkJ/uvXJUWw56R0DX0Cq8T43ylpHzEa8bN6hcW7rjeT7ueXeX59XgKnJOr16AZ1SCX8=
X-Received: by 2002:a17:90b:5828:b0:311:e8cc:4264 with SMTP id
 98e67ed59e1d1-31250363513mr19184328a91.12.1748841425612; Sun, 01 Jun 2025
 22:17:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250527111227.2318021-1-quic_pkumpatl@quicinc.com>
 <DA70A4LOJ57L.1RTX2K0Z6PU0L@linaro.org> <5b28e37d-6d46-472a-9aef-d2d86ea8f04b@quicinc.com>
In-Reply-To: <5b28e37d-6d46-472a-9aef-d2d86ea8f04b@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 2 Jun 2025 08:16:54 +0300
X-Gm-Features: AX0GCFtphupxUXzge-OP-7CeHDdsIOZC-CkWPj3OAeMdCwPb4GB5B5RCJ_MKFaQ
Message-ID: <CAO9ioeUPQOTgAY1FDW=VCNbcTHv6jZFnjF7F0JdJb5Px3Dhotg@mail.gmail.com>
Subject: Re: [PATCH v4 0/8] Enable audio on qcs6490-RB3Gen2 and qcm6490-idp boards
To: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
Cc: Alexey Klimov <alexey.klimov@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
        kernel@oss.qualcomm.com, Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-GUID: Ky-nCVm0RqE-gT27e4E6yQNcP_7SJ6Wr
X-Proofpoint-ORIG-GUID: Ky-nCVm0RqE-gT27e4E6yQNcP_7SJ6Wr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAyMDA0MiBTYWx0ZWRfX4lVFODxMVDjo
 r+40AB+pl6EPVQXdAifICG4kFf/bA4vZhMeiDNCnhmlu0WDUdD/+Ox/GYF3nqAstRfYr4onbkTN
 v1UnuwebD49L9diBtrE9o69xtWiAlhuWNJgXoiVHoDFYssgz65kwvxZ3VoC+9BeYi6NdkCT4u3O
 K8J5vZBJbEQQOSGX+G+kjDpeBQCRVJpcoqREIuH4FDFTXLB3MJFWnGATaOyJ2swgIHOM1o/ZKTR
 ZO30OV6gmw2YxEl0YoCNtTh0r/wRCOz++m0pQgOvFjQ/CH5C0cCaYU0vl5BvGcGITBGpeBhcgP5
 s+ht5ciUv1bGhDCUvrSid7PxKnbZSAdcx9ManLRsOX75//qwQiTvjwIcHGczPfFxCkoJ/v+63Lr
 wUxB4KH4JmofsHywbhuz2ZgDFeR4WNhgIimdwpbesW8H+lLwM33KPQy/JZw/aDQdi+Nv7TEb
X-Authority-Analysis: v=2.4 cv=XdKJzJ55 c=1 sm=1 tr=0 ts=683d33d3 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10
 a=NEAV23lmAAAA:8 a=COk6AnOGAAAA:8 a=XMtzzObD5LvXkpxU5CkA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-02_01,2025-05-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxlogscore=952 spamscore=0 lowpriorityscore=0
 suspectscore=0 phishscore=0 impostorscore=0 clxscore=1015 mlxscore=0
 bulkscore=0 malwarescore=0 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2506020042

On Sun, 1 Jun 2025 at 16:02, Prasad Kumpatla <quic_pkumpatl@quicinc.com> wrote:
>
>
>
> On 5/27/2025 7:47 PM, Alexey Klimov wrote:
> > On Tue May 27, 2025 at 12:12 PM BST, Prasad Kumpatla wrote:
> >> From: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
> >>
> >> Audio support is now enabled on the qcs6490-RB3Gen2 and qcm6490-idp boards.
> >> The updates include adding the necessary audio device tree support and the required
> >> dependencies.
> >
> > Do you have topology file and mixers commands (or UCM profile) to test this?
> >
> > I already asked but I don't see any replies. How this can be tested?
>
> please use these below UCM config files
> https://github.com/mohsRafi/alsa-ucm-conf/blob/qcs6490_qcm6490_hifi/ucm2/Qualcomm/qcs6490/QCS6490-RB3Gen2/HiFi.conf
>
> https://github.com/mohsRafi/alsa-ucm-conf/blob/qcs6490_qcm6490_hifi/ucm2/Qualcomm/qcm6490/QCM6490-IDP/HiFi.conf

Is there anything there that isn't a part of the 1.2.14 release of
alsa-ucm-conf?


-- 
With best wishes
Dmitry

