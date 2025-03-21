Return-Path: <linux-arm-msm+bounces-52229-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 445C5A6C009
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Mar 2025 17:37:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CBF593B61C6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Mar 2025 16:34:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0E641E5B68;
	Fri, 21 Mar 2025 16:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KAD96aLz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75181146A68
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Mar 2025 16:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742574882; cv=none; b=KDAYeujvpYcLF1tfO1RxmjvOLfLRrezy8T3u4w6lzypGH1lQCfp/IGas5T3Xe+U6gFmqbaSFJfGayKnTUi377QcZuCiCSw3QyXPQo/tJeT8jcJHXkLCnsVETZeEa+CNtbV/gLJltdX0RUP1Ly8KCExyZB0qIQ4LlU0sXGv9sNoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742574882; c=relaxed/simple;
	bh=0b6hF60Knc+sMkvma7g1QOjoquUgb3ux8++hhbe4Ya8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bMydvjhNj879PfhywcD0Pu8zsLzsrnDX3j0w8DW/+ol+frZgwnBEQ5ZMdRnNQp8M+ioIQbucBMaaIlMY9FUFHVjnHdEJWMk14sfCXcMqfz1QsUatMM2oRL2tFrmjGUG1MFqf0WJqluOURcM8ljT6DGJt7+I1h6RoQNgxfxqXq4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KAD96aLz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52LATE1b001625
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Mar 2025 16:34:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=EE388VEZSesC5LctaxpfptMO
	MU2c2Rmck6qRzYYeCuQ=; b=KAD96aLzA3xxCx0Dc3im/mGKqulsZ/H8sgX5+UGi
	bH/xD/KwehkvyRdrj3pczZe1pTmkxradOjczTz5hyN+j6fUsQ1aawG8VbvyaHrIm
	em7kb0QPWDE6MS8ZeezUwSlhL6zArGNL4mMli0n30J4ayxcGMrY87y48BInPgxkD
	1yQ+bgzoMPZxbYLdBwU1xGtW7HNRctaoujqIj6ryLC0mkomTABXwiZuWlfAFThMg
	qEfhGHs1+dXaxURZ//HsFmVOY2B1Z8lGWg+1J5JzdM+mL5mx7Q5TG6zoGTG+zBQy
	Z7dIZFm/6TGKyfFV8g3hCiaBIEgN9v4bZsHheGI6Th6qQQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45g3sf6k7k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Mar 2025 16:34:40 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6e91a184588so59123526d6.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Mar 2025 09:34:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742574879; x=1743179679;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EE388VEZSesC5LctaxpfptMOMU2c2Rmck6qRzYYeCuQ=;
        b=i9xh79NHNNT8KEWrQYppgs2vqSs58fhUxc7iy1/ntnnhECwWb9Kk7JpmhJQROI+GzZ
         SSSRyXnBiFW0X0EIuR7whyLdFEyViwivnkhDk7hQ6M5ohEM9d6vGuYt86EiUewtmaXbT
         xKw5K/lfgnFKCIRXZ2hWWSZ0mi/Q8/EIdzZ2lHnpray2SwSgcyHH1UnL+mBe0hknA0Yp
         UdphCu7z7h11SPa6ndeFvVTghTPCMyrkaJT0RTv2iR79bWmKbx+w3S3Lv5+wX6yJS66a
         hQLH5h5f9NWcL0KU+SsYQxv4YlN8G8RVl8IK3T7oeIpv+VjO+5jJgjr/NklkhoHCSOHz
         sE0g==
X-Forwarded-Encrypted: i=1; AJvYcCVPBL8odEC6DSUnktatcHEpia/+TSRGihXvQ288EoRKXvkEpzARviQzUHFchE5zlSj8lDw1sQS6oWvJgnAJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yyy3NHxdWnP6Br+iT2vjuw63d9gbzFCAg2wdNCIFi3nMB/iB5Ad
	/o38/EH9x6cPO++ymWUOH7EI5vqBBZPlgqPDpurs6FMkNRJg7g7d6rpYvBkJuWpIcckEfPAD/jf
	jz49tvIPmKkTFTAYZKEpXbspSURwq40fa3gwoUf26goNlA043SzfSKtZBhsD5puHT
X-Gm-Gg: ASbGnct4qEIuA8yOaF2+yUAbuKs+Vc14MklBew8wyKkVmQ5RTwAO0H5z4x77yd417Qj
	vf4FHErYeVAdakFUhOGpud7Pbe1OMiVO5QZIgU2FBjblZ80WFoe+sr8/k9WhVTYY05JnKonYq2f
	TRdRG1UnkZ/OOdCn8mdhin3CF83Um6blcnZ/xLZwo+G+AWRpG04EIokVxvO+nsXJqBKrrCYs+iq
	vLZHkz0sBxF7BmaEGsN2N5Q1PIZxnV/6NBS1wCNXoWa6PXeX+1OwdOqRd8TwYxfKEFDJlnsyUg2
	MssK0A4bOhOwTpyySUuOZ/+qUHckKEeT7wooA8WfYVgoE58nLSdCysZAcsSOmL9KAmmM1gdqwvy
	R5gU=
X-Received: by 2002:a05:6214:19cd:b0:6d8:9062:6616 with SMTP id 6a1803df08f44-6eb3f2ba60fmr59080376d6.7.1742574879283;
        Fri, 21 Mar 2025 09:34:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHp3DOhzM+XReSZ3mycd+S6hNB8v4/e/R/YvL8uoVVb2w9+7h2Gtkt/guRDgFNGXHv5VmsTXA==
X-Received: by 2002:a05:6214:19cd:b0:6d8:9062:6616 with SMTP id 6a1803df08f44-6eb3f2ba60fmr59079896d6.7.1742574878954;
        Fri, 21 Mar 2025 09:34:38 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ad647cb44sm216887e87.86.2025.03.21.09.34.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 09:34:36 -0700 (PDT)
Date: Fri, 21 Mar 2025 18:34:35 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: peda@axentia.se, broonie@kernel.org, andersson@kernel.org,
        krzk+dt@kernel.org, ivprusov@salutedevices.com,
        luca.ceresoli@bootlin.com, zhoubinbin@loongson.cn,
        paulha@opensource.cirrus.com, lgirdwood@gmail.com, robh@kernel.org,
        conor+dt@kernel.org, konradybcio@kernel.org, perex@perex.cz,
        tiwai@suse.com, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, johan+linaro@kernel.org
Subject: Re: [PATCH v2 4/5] ASoC: codecs: wcd938x: add mux control support
 for hp audio mux
Message-ID: <cxnmq66gww5mopwwbnw34gx4ynoocf63c76lwwn6h7eklzxhap@whjsxav7nggf>
References: <20250320115633.4248-1-srinivas.kandagatla@linaro.org>
 <20250320115633.4248-5-srinivas.kandagatla@linaro.org>
 <rdvsnxuc6by6sci56sh7thzpxo5cqi7q24fnmc7hi5yrfszwrg@kqjpiilko3xo>
 <b1aed195-b2e6-4f48-ba10-3049d74085a9@linaro.org>
 <CAO9ioeWLRfzUOwjnFsi_yztdJo2Q25bhvjddh6D3naV_K5eShA@mail.gmail.com>
 <1d93f731-66c1-47b2-a249-9bdb25205525@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1d93f731-66c1-47b2-a249-9bdb25205525@linaro.org>
X-Proofpoint-GUID: 54LD4iGkFtYJv1yYHzCEJvM7Bvsh_Pbx
X-Proofpoint-ORIG-GUID: 54LD4iGkFtYJv1yYHzCEJvM7Bvsh_Pbx
X-Authority-Analysis: v=2.4 cv=R9IDGcRX c=1 sm=1 tr=0 ts=67dd9520 cx=c_pps a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=KKAkSRfTAAAA:8 a=cFvnhfngp7Wf6xZ2y_AA:9 a=CjuIK1q_8ugA:10 a=iYH6xdkBrDN1Jqds4HTS:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-21_05,2025-03-21_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 phishscore=0 adultscore=0
 suspectscore=0 clxscore=1015 mlxscore=0 priorityscore=1501 malwarescore=0
 mlxlogscore=760 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503210121

On Fri, Mar 21, 2025 at 01:26:44PM +0000, Srinivas Kandagatla wrote:
> 
> 
> On 21/03/2025 13:16, Dmitry Baryshkov wrote:
> > On Fri, 21 Mar 2025 at 14:35, Srinivas Kandagatla
> > <srinivas.kandagatla@linaro.org> wrote:
> > > 
> > > 
> > > 
> > > On 20/03/2025 14:03, Dmitry Baryshkov wrote:
> > > > On Thu, Mar 20, 2025 at 11:56:32AM +0000, srinivas.kandagatla@linaro.org wrote:
> > > > > From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> > > > > 
> > > > > On some platforms to minimise pop and click during switching between
> > > > > CTIA and OMTP headset an additional HiFi mux is used. Most common
> > > > > case is that this switch is switched on by default, but on some
> > > > > platforms this needs a regulator enable.
> > > > > 
> > > > > move to using mux control to enable both regulator and handle gpios,
> > > > > deprecate the usage of gpio.
> > > > > 
> > > > > Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> > > > > ---
> > > > >    sound/soc/codecs/Kconfig   |  2 ++
> > > > >    sound/soc/codecs/wcd938x.c | 38 ++++++++++++++++++++++++++++++--------
> > > > >    2 files changed, 32 insertions(+), 8 deletions(-)
> > > > > 
> > > > > diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
> > > > > index ee35f3aa5521..b04076282c8b 100644
> > > > > --- a/sound/soc/codecs/Kconfig
> > > > > +++ b/sound/soc/codecs/Kconfig
> > > > > @@ -2226,6 +2226,8 @@ config SND_SOC_WCD938X
> > > > >       tristate
> > > > >       depends on SOUNDWIRE || !SOUNDWIRE
> > > > >       select SND_SOC_WCD_CLASSH
> > > > > +    select MULTIPLEXER
> > > > > +    imply MUX_GPIO
> > > > 
> > > > Why? This is true for a particular platform, isn't it?
> > > 
> > > We want to move the codec to use gpio mux instead of using gpios directly
> > > 
> > > So this become codec specific, rather than platform.
> > 
> > Not quite. "select MULTIPLEXER" is correct and is not questionable.
> > I'm asking about the MUX_GPIO. The codec itself has nothing to do with
> > the board using _GPIO_ to switch 4-pin modes. It is a board-level
> > decision. A board can use an I2C-controlled MUX instead. I'd say, that
> > at least you should describe rationale for this `imply` clause in the
> > commit message.
> 
> I agree to you point, but historically in this case us/euro selection is
> only driven by gpio. But I see no harm in moving the MUX_GPIO dependency to
> machine driver KConfigs.

Machine driver also doesn't depend on it. MUX_GPIO is selectedable item,
so please handle it via the usual way - defconfig.

-- 
With best wishes
Dmitry

