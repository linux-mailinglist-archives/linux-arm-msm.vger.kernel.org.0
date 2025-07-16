Return-Path: <linux-arm-msm+bounces-65270-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 76CD5B078D6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 16:59:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1B8155666F9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 14:59:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2F2A2641CC;
	Wed, 16 Jul 2025 14:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZCe9vYPX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5346B1B043A
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 14:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752677941; cv=none; b=KaNj4vMmV3dcT467/ShGQ+Qe4UHxgzhE+rgX5IkqP7kQEiY1sptG0oA0rJTIaYTMVT6vwufrq4zr3sZz0ocemt5bG1W67KRXnAP2Ay11kV1L0i1ynZ/CHmjWEp/KbVLmu+0P3/Pwri7lRXwU+Bw6cBjXC5zQ+pIYIb1OKko9dak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752677941; c=relaxed/simple;
	bh=yNH+wmDjufWxRYFOsvT0yTAPl1lHuqLKNpXrvQyJDlg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ucEiXulZAOLwBWAmW7BSb7XVc3KtWnAgsQuSUg8K7ojddq8m3wbJQV58bIMjtkTdthZpGVLg04IG8/iVQa/7SfW7SI37XxJX97LmjtgQLs8OY0CZOMkqqyY68qdree23Y5LA/+HaRiIZNiz+CE/zNUfkhsYbdMmlhgIYz4DNLpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZCe9vYPX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56GCsMv8007235
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 14:58:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=YN6JbYLnBlvgbw9acA6SW1dp
	43m1oM7N/fUaL2L/QaY=; b=ZCe9vYPX3wMiniUiVRvSasJw0Xurgz+nYMUOf326
	Qb3ermMtD5xMtP63pstw9penUD+BW3G7Uml2WJgXF+Yv49DrX/HtuHvYcyK4tDPB
	6REAJyggQRAO+IcHqBqQzQe9mTN//6AggugM5xDC05/B9xr+Z0jvgeCNPAJjnoGn
	ULdmHQCW19H1+2/4pRkbUD4JMPRRnplE33h3qbsCQogFHtC0/SuhBRxzWb84tsMm
	PTDw7iNB14xfpO+bOxTUb0+xj9AmRUahDHuOOedOhlBiB4GEgKIoRaS45xdQRFWS
	On7YlefKfmB4qxu6Nnw6kx6A9xiiT6k14swT1Ttoj6mJwQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47wnh5vjvv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 14:58:59 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7da0850c9e5so1106271385a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 07:58:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752677938; x=1753282738;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YN6JbYLnBlvgbw9acA6SW1dp43m1oM7N/fUaL2L/QaY=;
        b=NmzBrdvceQV6s9kYIxj7bNdizM3JxJyKShqJoR6n2PJZegDCI7rxJ3YDLRvIb62vB/
         LWNIGRERjreV+fB3BlRcgJiX7OeyW7SrSc88p4c3ibkRRCfW5cP+pIb3W70TjHUoSwBa
         X4sw7znMoVRqH3wtoc40WoasHfCg0LHprVrLutwVhuiAA2PgPvrPPGJsH5tNr/Pkxjou
         SbAlBzKJM/kShEkF4ff4XlUlb/8Yp0Sm59mnoi8X4fe+puU647850e0C39Icx74FsSKA
         LrTK8Ml6alKXHbf2MdeLBxXeEmnpxA7MbeHnzwMwh6e/S5FPw2OPXJSbsXUvcehGnJ+x
         z0Yg==
X-Forwarded-Encrypted: i=1; AJvYcCWJz2y+rbBYuyGvYqn0d/UMlv414OI6R7xySoczOeS9D3cKaYxRF0CIWUVQBtFQH8iOFnqhrM2C8jxgCx1M@vger.kernel.org
X-Gm-Message-State: AOJu0YzwYJ3wdpa4gmOXvOJc08G7s4QSglL2DNc9LjQXpP4EgdU8e574
	NBiSn+ezlwEdxdGT//0chcFn0BsPk5ncGBj4PEOBGqBLwizbdWnxHEzGzeei2OqZ/3tO7rGV3CQ
	PWIaUBYJc/6sTslwQXX3irUUUECXS52fIVVuwa8L/6B1Pzt8RfaUPWt7zaXtYFZvkRjsG
X-Gm-Gg: ASbGncs210Xc70hBAnVDMorR7tC3zoisJ/PETHNBfGpf2sONFhEzxBzJQn8eMnPXpDd
	yNFfTZk0/hKw1kJsId38Cu/SuswYqbCIAmkvcWLWZK/BAu5PQznUnewnFaO+zEC/6+70GDYtthb
	myLofomZjVLWEEpiBnjXMazRsjCV/ORVNewGrAsvPGF2tZ+6y84q13ghW9Sm/D7fRRXFu+BsWdA
	d3s2XhcOpKS3Bo/w5ZTIGcRBr42mpkvA+9uTRKgyWrgPM/fdhmxKhptjQYc5avFbygMN50/38ex
	pzDXItsjOp3uZbwxuFRZSiqK7XKPxoGtVdradSPGqk2nfuM/SUU4Mqm2OZK7ShIX5TEbb14gSPm
	rmlyzd8TxZ6Rx8Yl2zD+XCrRoMyZNmENTUvu4nauRDdyXwBcWANno
X-Received: by 2002:a05:620a:2619:b0:7d5:2332:2830 with SMTP id af79cd13be357-7e342b36709mr421118185a.33.1752677937929;
        Wed, 16 Jul 2025 07:58:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHKICHX7roJSrN0WrDZrAy3xxA9a6ZQocb3aEr2yhOtprSQ+ritUHpZcVpGq1dw5wx6d2JVQg==
X-Received: by 2002:a05:620a:2619:b0:7d5:2332:2830 with SMTP id af79cd13be357-7e342b36709mr421113985a.33.1752677937396;
        Wed, 16 Jul 2025 07:58:57 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55943b6ba2esm2665790e87.185.2025.07.16.07.58.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 07:58:56 -0700 (PDT)
Date: Wed, 16 Jul 2025 17:58:55 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Arseniy Velikanov <me@adomerle.pw>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Luka Panio <lukapanio@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH v2 1/3] arm64: dts: qcom: sm8250-xiaomi-pipa: Drop
 nonexistent pm8009 pmic
Message-ID: <rfhwcpyl656hiebwradmniwtnkw3odffa4vbx3q6cxlhjjpae5@tnmo5666dv3e>
References: <20250716141041.24507-1-me@adomerle.pw>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250716141041.24507-1-me@adomerle.pw>
X-Authority-Analysis: v=2.4 cv=dKimmPZb c=1 sm=1 tr=0 ts=6877be33 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=pGLkceISAAAA:8 a=9pW74NbYAAAA:8 a=EUspDBNiAAAA:8
 a=C8rwROSvG5smQ7Soo1EA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=67o8LzlnqLyy2xoPAWJp:22
X-Proofpoint-GUID: loFkI8bTZ12AtjV0cdMj19820JVAdvoO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE2MDEzNSBTYWx0ZWRfX/f6cYlcAhAGL
 Q27C0cSfIjhFpXJITc06rE993QYoYVq8BEkUkgsedY1ezfJhNWlQzgmDfb2944nsgh/8uor4VxR
 ofgNwCV5eYfMvnYytBbmMy5u3darRCZ/NBEI8VRYsAReTn4eLYPAJ9X6dJI7ISa5lL8rIsYL0zC
 O7wPlVIMtmqWaS170OfHIpt4n/W4glf4k32yPB7F9U0ZyzoxfiP1ewk9OOx5eCSyRGcwv2PsCvz
 uD0gxKLwEQsa5PRTDyJ1W2qt+sKWPh6nSI2HU8jR8/2bQtNBfmbCH+OIhm2n8S2J/gRUhKlA0+B
 t4l64CGdKVwy3HOOEzANZ6iMYuYWOgkOGuoe0M4jw68pz6w02B8Hfi63jsZqvwHynz6pn2KT93C
 NewkzF5wGTLTw9XQR+aan/Xl4TirtQF7anJqw8rpJYQfjgAxpAkHML7s22xXXuArnzUxF+HW
X-Proofpoint-ORIG-GUID: loFkI8bTZ12AtjV0cdMj19820JVAdvoO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-16_02,2025-07-16_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 mlxlogscore=650 mlxscore=0 spamscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 phishscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507160135

On Wed, Jul 16, 2025 at 06:10:39PM +0400, Arseniy Velikanov wrote:
> PM8009 was erroneously added since this device doesn't actually have it.
> It triggers a big critical error at boot, so we're drop it.
> 
> Fixes: 264beb3cbd0d ("arm64: dts: qcom: sm8250-xiaomi-pipa: Add initial device tree")
> Reviewed-by: Luka Panio <lukapanio@gmail.com>
> Signed-off-by: Arseniy Velikanov <me@adomerle.pw>
> ---
>  .../boot/dts/qcom/sm8250-xiaomi-pipa.dts      | 58 -------------------
>  1 file changed, 58 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

