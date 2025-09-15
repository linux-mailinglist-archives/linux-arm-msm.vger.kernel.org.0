Return-Path: <linux-arm-msm+bounces-73454-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 09D89B56D2F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 02:12:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B3F9A3BA3DA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 00:12:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC80F347C3;
	Mon, 15 Sep 2025 00:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K3LJOp5j"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F4001F61C
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 00:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757895114; cv=none; b=Ap+872u9QmgyZhoiMiZSxGNSyjankM50RKdJ0fdJS9DrRJoZ8E3qgyMCS8fxnRELvt8D9rDsmI6PF05db6mm01q5F9fRg3eA83g6lUcXDRXB5pAw6QHigFEOMOaBLprjFSLKyVEhenevIeXvmUbcUsOSnu7Y/seJfviw8V+VBJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757895114; c=relaxed/simple;
	bh=iSoyahLZuzvJW/LLpw2WRZ8dNqvwIYHpD2wjF+DRt5M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VoKmrdawTQUgr9L2//y4+0CFFhEN6o5RsA48hxTb27c1UiU9IeZEU8G4rf2ed3RgxI8Bnj1tRB53J148IWvaDgLNeifArYa9TWICCDkcG8/komoEgQvLUuS9YjyO9YT9Z3+I0l72eAht/S0CMGFDgtvFoyXy4nQzKSjHPgqwKyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K3LJOp5j; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58ELUCgL016210
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 00:11:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=jgubuXIBHxl1EspmzGxmpMOu
	9GhsFOhOkdvbf4oIGsk=; b=K3LJOp5jN8EpntH0qMi19Cg/3wIT314oQaaADRAy
	rABW2HFKk9jWNvs6cuIoPd1HXB70rcUC2QIZrD/csiva7OdE14at9QD4/EoV8i3O
	K9x4thQTv4L+8L6RY8Y2wdrSDl2VCOIz9N8zVttL+Uw49aedXmhAjS921FBTK/3J
	zy+pqE4koEApxj71kUnSOw4dbq4xz+kBKbcr+AAjbtt2lkYAqI6/oaK9aNh1h4cx
	eJJTyF/Dnqn48hipTflX8HfAdbklVoNlTLFwzI+hLoZl4/ZQI0X81qNohoEPyuKl
	BdSSi0JKEibRuzhtBjiQvl/idmFg21vUP1XQXiThFrvBbg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4951wbaujf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 00:11:51 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b5f9673e56so101541671cf.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 14 Sep 2025 17:11:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757895110; x=1758499910;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jgubuXIBHxl1EspmzGxmpMOu9GhsFOhOkdvbf4oIGsk=;
        b=mpAPWDlgt97V/5KVzSQOsnu9DdHSqLGMgNnXDyM3Xep6udeA7S3YSgGB0EBF7EysMP
         QPyFa3ohuVV/Xl7B2pp44aHG+jfJugQPKgRWHJzopEukEO0566g9xTT+b6f6ZSHNhFXN
         nLFHCaCfZ48kXI05IPx2tqgPFw9sBbySBsk/UoEhrNC6AkyRrE3/8xsurkinuff2IvVQ
         wxWv8L4kbQ+yCkFdTbgYu2X/q7NAGv1vYfGMKtoIx106bPmdQDLeUMotXofjtY3BEYfl
         AYpw5F7J5/Eg4NDhEUT+wPAL/HP07FfbjpYpYi8ATUXkUhEzrLf56VC7auFiM20ui548
         ft8Q==
X-Forwarded-Encrypted: i=1; AJvYcCWkss1um41cuR450aBu2GWRCPg9kM0trzJTsU2M9p82lRa3vZf8OdpOtxyVsjKluoTfxPR6G8Esz1cJ6EmL@vger.kernel.org
X-Gm-Message-State: AOJu0YzAbZ55fEEeiZgVpGzHBQTCzrpIKstOGBQRMehOml6IqlLVgcRO
	gD6XAzc9zM0TMZVYj5p+sTN0ZkWCx04hAG4xLrnxyW0tQ1rLB8QtzQ+xgVQ9yXZhPLzpuGLrdYo
	R7FZwaQ+9EkjYoWwaG5YAFimY2IZfMdi9AsSFt5oKBYwuzGtjuOgO2lfyTn0/djrB1SlzppzGNf
	Vi
X-Gm-Gg: ASbGncvvcaQyAuUoJNi67qSWRNzUsX6KWZ5wIYMnl9jKKs19CWKJ+6/pQqS8IiefQZr
	bKWBZT5BDymqqgbKPmIStplJoWZdcCUfK00vH7AwI/yuhAKRBjvQCII0wUJnBgYvGExv9YTEG/q
	RzP96nYyM++jB1mTkqp8TWnBtIaPtjurz/1qi4GCeQkesiY/qBNtz7LZ60oKvhLwx30M65RgZxg
	eoNc3qDkpLVnHKcFvdbzRCv7ae/n1O4nI19tX3pMzuZiJ4UYlZLOrH2dTQPIhzSpcGhiiOLncow
	acPD7XAIsKJXAhAd0qVNOZkjqpU5R39Eg3SoVuUayDAvhqrl54pib0n7+DgkEsEyn5mwWMaTShg
	6aMvA0Wz2hhw1wXPFBVGobjm45Rz5d5SoEIq/u50YPtOeMcY1lUC+
X-Received: by 2002:a05:622a:1dc5:b0:4b3:ce3:9615 with SMTP id d75a77b69052e-4b77d0e734emr103191731cf.80.1757895110175;
        Sun, 14 Sep 2025 17:11:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEr8fMcGTWpoT3vdfr5rMRLD+sgOyLchYdmKd5WBs6kKIgs17duY0sHaa7iwCY30pATrgGWFg==
X-Received: by 2002:a05:622a:1dc5:b0:4b3:ce3:9615 with SMTP id d75a77b69052e-4b77d0e734emr103191611cf.80.1757895109746;
        Sun, 14 Sep 2025 17:11:49 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-56e5c3b622fsm3227252e87.2.2025.09.14.17.11.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 17:11:48 -0700 (PDT)
Date: Mon, 15 Sep 2025 03:11:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Prasad Kumpatla <quic_pkumpatl@quicinc.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@oss.qualcomm.com,
        prasad.kumpatla@oss.qualcomm.com, ajay.nandam@oss.qualcomm.com,
        stable@vger.kernel.org
Subject: Re: [PATCH v1] ASoC: qcom: sc8280xp: Fix sound card driver name
 match data for QCS8275
Message-ID: <ocevx3x6rniczf2sjhd2yie5i7obhwrohim44sqiev2cdngivc@lapwpkqbq6o2>
References: <20250914131549.1198740-1-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250914131549.1198740-1-mohammad.rafi.shaik@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=XYKJzJ55 c=1 sm=1 tr=0 ts=68c759c7 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=b8Ncz4iFJ-U_pff5yioA:9
 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: LwEkfwx1yE3u18IdwwkGYp28rXyWwHrE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDA0MiBTYWx0ZWRfXx/gpvpjOQ4Gz
 O0H6Xw2iIwFyzI+PBxllvqhxF9UzW0PcQHlOdlBNxlHpp7cvPzHLGQgRvm96E4u++jz35XoTjIL
 kVy6/0yYIZj7cyzKhF7jOe3Q5ziwyiFOu4MqDS9NxFnVW0Y+SD8ExpgrqGjvigQh9D47xX/sto4
 bAjNRgV5SkS6LypoFxi2+bWevzEfe2XI6qy4/HUNjzZDuVAGikvgBCoJxv5OsMzcNDH30V8yKmH
 oXQJFs9H+QrxmIO2QDj4ACKyS6LhoEQnoL+JERxh5QKWJlfE0vZ6wX8s2I58jxFJKjuyYJ/U25m
 5kO5eO3FE3lAFeHyy/nUQX7OUcCjQU9Tn4VwI7IpQFDOKekqZ/j2mlpNRw17dPNUUkd0rR8umzZ
 Si3tWOuo
X-Proofpoint-GUID: LwEkfwx1yE3u18IdwwkGYp28rXyWwHrE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-14_08,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 bulkscore=0 adultscore=0 phishscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509130042

On Sun, Sep 14, 2025 at 06:45:49PM +0530, Mohammad Rafi Shaik wrote:
> The QCS8275 board is based on Qualcomm's QCS8300 SoC family, and all
> supported firmware files are located in the qcs8300 directory. The
> sound topology and ALSA UCM configuration files have also been migrated
> from the qcs8275 directory to the actual SoC qcs8300 directory in
> linux-firmware. With the current setup, the sound topology fails
> to load, resulting in sound card registration failure.
> 
> This patch updates the driver match data to use the correct driver name
> qcs8300 for the qcs8275-sndcard, ensuring that the sound card driver
> correctly loads the sound topology and ALSA UCM configuration files
> from the qcs8300 directory.
> 
> Fixes: 34d340d48e595 ("ASoC: qcom: sc8280xp: Add support for QCS8275")
> Cc: stable@vger.kernel.org
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> ---
>  sound/soc/qcom/sc8280xp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Thanks!

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

