Return-Path: <linux-arm-msm+bounces-75992-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 152B7BBCD4E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Oct 2025 00:23:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B116C3B5C79
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 Oct 2025 22:23:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF0CC2248A8;
	Sun,  5 Oct 2025 22:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GSyeppwx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87E0028E9
	for <linux-arm-msm@vger.kernel.org>; Sun,  5 Oct 2025 22:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759703010; cv=none; b=YlNDFROwLHwpcW4eFilaA4zg36PCt7GkMwF58D3CWYweOKcSfsMBD0nmsXIrZcUqk4zOwHqSClX0Y3Vm0gjzGzCNWVANLe9485Fs424jxkelak7sk5CWY4tNYJQOb4vdtdPyyIYOaaXHKaspKZm2qwdqyu9CONumpRR8Qd3E7rY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759703010; c=relaxed/simple;
	bh=Z/d1cmHnIpZcYmrdaRS5TreRCAVULFhW1i/E94Fp3Wk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rPOuck7xf49OUWaLrhgfrGs4dug/hAVKg5tcUadzyJ4PVAf+sdiIuJX1QYG+rykK7aMIU7dbVR+5utlAYBEO+dBAXtQiCKwFL28G/LzuhIsdUo3BN02IZpBw/tH/rKcl9WIYHtguMRHES27tCov7R+68rvUhiKyTDrJtNgD6RYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GSyeppwx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 595Ht2gw002165
	for <linux-arm-msm@vger.kernel.org>; Sun, 5 Oct 2025 22:23:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=HkavZTNmerI5o65w8ncgVohP
	1tuZa7qLx/+DCZ97ays=; b=GSyeppwxYtkpNvEB9CXu7VHD8FyexvjJz09BThVA
	5MPxqhXZyJSts66XXHTAxIR1bFnuhC9DZxsASNgp66jNYt0kM6qL/Gy6SQKvEEEo
	IagmU8JAAN0dm9q940Icup3xpYtcRaW72MRXDOLf/wW2l0Ejo3v3RL90taL3/BFO
	UIC5+m1OO2oec3Ed5BxYdFO02cLR/WApAA+MVl8jKA5PR+iweERhqBIos9th3Drr
	ZlOyJGcpArwWipc/xO53vlvDiZ02uxsfClYVmhkCRigoAvrGYsVy9e5LHy5EwoLp
	Xes3IC5K/wDYnhj9azlBhgUkRU7gTaggao9l9ZcX0hj3xQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jut1jghe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 05 Oct 2025 22:23:27 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4de5fe839aeso103954401cf.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 05 Oct 2025 15:23:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759703006; x=1760307806;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HkavZTNmerI5o65w8ncgVohP1tuZa7qLx/+DCZ97ays=;
        b=QVP+s9ggESCmGS5sysSzIwy51OFEUNWX5+90xPKi8nbeD6ESUr77TfWS6tTecL5+UT
         pZEZnWfvYYYGIe8XL4WQXfpSaiMwbnJAqCnjOty2C/5z6Dhqo0K9KjazSfjxc1oGwTDC
         Eoo+pDRq2gpbGotRtbCdDgZoUKbMqp9eIxPXpB5h5ko/zeaCY4idRZ5ec/AY/mELg0tU
         yalAmS4kiNweA3ZL4gU2c1g3JIbqDcOWxCU6YYEeBaDzTJRFA+me+eR4Prl3XM/mxBPs
         ljTtXlCCl+/bdu17QvDiQ2HCh/4k4m/txy4j/c/IYg0GjixeAcqxhV1U8zhz7arHHlcI
         HXpQ==
X-Forwarded-Encrypted: i=1; AJvYcCUuSdQCgCyfMLiX4xuZFURJ7M4dMoC4l81njS920zoE5QhCauUsobeR6wdC5EpNUANfzIHsD8s5PGEmk+ju@vger.kernel.org
X-Gm-Message-State: AOJu0YyEJc+JqCxAyxuuLgxcdBEzigJFkAPIob82u4MoZ1u0JmXxUvR9
	i71uGD8NPWdL98DOXM1bQnILXfx+0q687zlQSgbbazGwnx4dKIHtjydl5pZ+byCxIcHQi6GVWce
	yzffs1JNpnXOc9h9ZRK8w+1Ly0kuE5lZY9LvnwcIh3qZpNUk4UYB/82hhJA+cCNWiyWiU
X-Gm-Gg: ASbGncvV/gwdfIQRysX+nzeXNL5W6hmrcPhKopiX6+4hzDn7iv9O3gvVLhumtMQemfw
	zsqfs3gbKnK3atcyAZorgadWpF5rfQE8dRZZF0s3O/gguDvP/Y5RTnXnidyFRUNDbUCQGKE7J0x
	PpFmMg+BBgHl2Vssu7hA8OdfDg4p6FpuYnDKEVQHGLd/qJKAvnJRj+dVp/Q8X4UsPgc7YaIJq3u
	mU0HOtqYByYmw/5vbNciYINBVf5EJhr0xL5LDJKEZKQ6kKkITskRTEBBGBvTyWj10zyI6w3/bN6
	YHGB8kZeRFcS6h+EThneLFDxFbgwiL7CL2VAi5AClmH/uVXgTGnt2Fx0nUYlt9dzVFEtrW5GLLC
	oYmGXtLfQ8i6wQEgmdErVO34AGyk5GKevts/Zr3LIn7i9Ayu/7BvEbFv55A==
X-Received: by 2002:ac8:6f19:0:b0:4b5:781c:8841 with SMTP id d75a77b69052e-4e576ab89d5mr143936821cf.42.1759703006380;
        Sun, 05 Oct 2025 15:23:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHusGPKlhdeM3kKfumOVt6gnrGqSczS5SCraNaBCAp+0/JuOqrHjGq6QZKCt6SI0m+MD3AuKQ==
X-Received: by 2002:ac8:6f19:0:b0:4b5:781c:8841 with SMTP id d75a77b69052e-4e576ab89d5mr143936711cf.42.1759703005960;
        Sun, 05 Oct 2025 15:23:25 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-373ba444480sm37937761fa.30.2025.10.05.15.23.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Oct 2025 15:23:24 -0700 (PDT)
Date: Mon, 6 Oct 2025 01:23:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Chris Brown <crispybrown@gmail.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Paul Sajna <sajattack@postmarketos.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Amir Dahan <system64fumo@protonmail.com>
Subject: Re: [PATCH v3 09/11] arm64: dts: qcom: sdm845-lg-common: Add camera
 flash
Message-ID: <gk4dxz4wavdc66xr76bwiwu6o4f2d3iyxxwnyr3onmkwhlgk4k@tlvnmzbfbzbl>
References: <20250928-judyln-dts-v3-0-b14cf9e9a928@postmarketos.org>
 <20250928-judyln-dts-v3-9-b14cf9e9a928@postmarketos.org>
 <42463474-7fba-4df3-9dbb-24140581690f@oss.qualcomm.com>
 <CABN5=wEpekmKxFCr7nBcYGSt6ZH-g+bx7Y5Nmoo=tMrorz2XBg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABN5=wEpekmKxFCr7nBcYGSt6ZH-g+bx7Y5Nmoo=tMrorz2XBg@mail.gmail.com>
X-Proofpoint-GUID: DRFrzaAWplMgVsbaX8NpVun98qLf3HWv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAyNyBTYWx0ZWRfXzuJhlBaMgC7J
 P3gaHecxlsEKNX2PHdv1HtHIg7KNBdPkiO/509H2vq/KoQzkUKg2NgKWDhWpGWpGBKvc+y35PlT
 I5vl62PtC/dUcACVvZ7ejqKis9MPbel2Ixsc5+4jfSgrmSrlxbiRa6PySV1e8IGm5zlzK1nv1+B
 aiS7Wulyb3/zEHCVuszZdxUlt2omht3KgYxs1bBRYDEnYV2i+zINz5PgQJhcltZXnZlbzm6ta5L
 bsPOXONtfsDmPVuZZJnmJaAZ/dHHuO5jeinbybpH+p1aqiopL4uwvYiy4uFqB1r/H15/jInnNeL
 g99phYq7AvXCg81aC+eqmf0j6/k+o3z/3VSlOmQ/W6yacYVKRArLNwJk3E6fIb/v2EcCnBBYbgX
 WjfIzzvQan54ZIj2HqrQ5iM0eQo6bA==
X-Authority-Analysis: v=2.4 cv=Vqcuwu2n c=1 sm=1 tr=0 ts=68e2efdf cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=4fvD49LNPrp0q1SnXk4A:9
 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: DRFrzaAWplMgVsbaX8NpVun98qLf3HWv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-05_07,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 suspectscore=0 bulkscore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040027

On Sun, Oct 05, 2025 at 03:35:56PM -0400, Chris Brown wrote:
> 850mA looks correct for the flash, whereas the flashlight/torch should
> be 100mA based on
> https://github.com/EmanuelCN/android_kernel_lge_sdm845/blob/U/arch/arm64/boot/dts/lge/sdm845-judy/sdm845-camera/sdm845-judy-camera.dtsi
> i.e. led-max-microamp = <100000>;

Please post your answers before the question rather than at the top of
the email.

> On Wed, 1 Oct 2025 at 05:04, Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
> >
> > On 9/29/25 7:05 AM, Paul Sajna wrote:
> > > So it can be used as a flashlight
> > >
> > > +             led-max-microamp = <850000>;
> > > +             flash-max-microamp = <850000>;
> >
> > Allowing the same current for flash (brief on/off for night photos)
> > and LED (flashlight which you normally toggle through quick settings)
> > sounds no less than suspicious
> >
> > > +             flash-max-timeout-us = <500000>;

-- 
With best wishes
Dmitry

