Return-Path: <linux-arm-msm+bounces-73663-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 794EFB59307
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 12:11:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6CDA8482D0E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 10:11:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EEEB2F90EA;
	Tue, 16 Sep 2025 10:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EdT9uVlZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B32612F7AB3
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 10:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758017460; cv=none; b=T95YVI0pZKf2PMN3jDgsrbSR0DIE1gpXLF2DxzJOua2rQwh4ZbNToMVidd4m8p3SDdCWuyQlA/Da1sPoKQwz530l1w68lJE7DAXwv0kyuAkbjUetmWpB4JdZ/Dk5TiLDGwsPrDC8IzBCuh48Ly5A056FHYufi3vyXPTVVOnunXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758017460; c=relaxed/simple;
	bh=N5w9sGR83HmehQkzcyb3yU5XfW4ZSkbi04N9GlT0S40=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mUKehYnyES5bTUs/POlDHMmxqVNcQ0uOHgzBjsDjzsKI/51wJNh3kudXyzociQibo2TYSx7TUoNGxihevpbR5t042C6Jqso/ErvY1xInzACkU2grSZtA60Rkaz9Rq0iihuaj0lYP0fecj7yNEDuD15vpGVSdINu/F6JnegEjvs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EdT9uVlZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58GA7MbB010827
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 10:10:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+Hr4QdaTngAzxON61S7ZU7L2
	1S4tZidHsM1IVv627kU=; b=EdT9uVlZ2cSqy652445IPY2VKG5O2/fIqWkQbY4e
	KkbBdgx0z4eg53VGih4iSDA07ocV4pP9X1t4gXzceD6ep6A24sQ2ua4FCdElIqCd
	oI5p2NmlHN/7YxonShTpC2dVeBzzUpzdNDrQc6yWaYCiL/pW/Tp7Yrc0j7iCfZVJ
	4K4r9EitS3Fr8NK8SiUrltEZX5y3wwi7eneVDgsD+lwKy7GQ4hhYLjtFDn60yenp
	Ele1bvwS+CoqjkZ5ZLp3cZPlzzkSdXkZToPNd14yzmkXf7Bnm8AFmZgMQI/rYl6Z
	xtPgJbrdl2kX31QYTXazJ0h1vnoBfcN3Esnrtf+gAaHEzA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4951snr901-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 10:10:57 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b793b04fe0so60089631cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 03:10:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758017456; x=1758622256;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Hr4QdaTngAzxON61S7ZU7L21S4tZidHsM1IVv627kU=;
        b=F1EcTSx7bYYSt9g0pEY565AbCrmGUgiRROy3s+/lBwFloBbjihIGloMr/kOpkEnrg4
         UK1b5qKWHIWxDyc4wFbdtoYCaEtEgM/38eHW5nQ0uW9F21cC0GrzLCZV2/97MiDLmNZE
         AP56rWt4yL4en5hlR3NrPdN53PW2p3+04PZ5WIYz7GewsJYcqiAO43/zT1OVA8aTMdv9
         /jvDcpG5lT5PNKl8x3CBARw1J6CcdW+DxSI85KswGHAvSFvIIEWJLTP9NcmqWCy9HbqC
         JyMjysDO/cZ49E2bmEuzAZUmBAi38jQXrvh/U3+K7nONr21qh+tCVeRLc5xHE69copu6
         YFyQ==
X-Forwarded-Encrypted: i=1; AJvYcCWavhCoyrhxiCMTi1yJCd8wE4hJzqD/p1D0ncHcz1PjDi24nyXFQ2E1MpDqK684CmZ/ZaS1dbwKdfyrwheE@vger.kernel.org
X-Gm-Message-State: AOJu0YypDaNJ3WbMq1OURbp9fbQrYm3FRKpe4enmXnSUnP4SZzB8LTGf
	NabCqQtxD6Kv8rVtIcJagNgoMdwfjF4SmzsdrXZWJQJCP7GOYyaYQRDTaCnXSHuDNqo37Y1r+S9
	ZiVxhTcY2yI7h1LPLYkpez07+R71P9XLS9G8ym40G7mzFZgf0oFeaI4e8CFNsdyeemowv
X-Gm-Gg: ASbGncu0RuDCyZ6liTgOGQrgQXVtmXIA512H4c7uhiOky3sYcx1R80sO2RsVBFgOmZn
	90VrGjMV5+Cm/guckkKTfN9Mwz0XcH/wWc7FiRs5kgf7GNLEVCHxG0MdNT9XMSmP49JINS+3Rif
	F1RKNbRtXHLsuUK/kovCX4kA5/HNBMDBVY/E8rM7e8ILDj4ZJKTGfKg78kOddLw/3AMtYUwKfud
	CT8/XHcVyA6FLeFj0dw6YhIKULSDHTvXk8HrY63MNFgmcRiLquDwUnEleAm2rhjq3dUxnq5pBHr
	S+TvZc5ANKO4T36G1G0xIlyrnWbvyDCMhAdTiWk02sU9rAYkvC3tE9xOMI10cmvpcibSgRvV+B1
	Wsjfvxu0JJNw9P8fYX+gU//hXmYGOhh1vGLp2/uAERX2d0LptMLlB
X-Received: by 2002:ac8:59c5:0:b0:4b4:8eb7:a45e with SMTP id d75a77b69052e-4b77cfd7c3bmr187846931cf.35.1758017456263;
        Tue, 16 Sep 2025 03:10:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEYmRtvb+l0jlW/S7lOSeC4zeZd7f9A/J0FIqtj2p1keSF3dZBC3idnn20IpIn9AtMWbRfH7w==
X-Received: by 2002:ac8:59c5:0:b0:4b4:8eb7:a45e with SMTP id d75a77b69052e-4b77cfd7c3bmr187846561cf.35.1758017455741;
        Tue, 16 Sep 2025 03:10:55 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-56e5d8c4783sm4320157e87.56.2025.09.16.03.10.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 03:10:54 -0700 (PDT)
Date: Tue, 16 Sep 2025 13:10:53 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] arm64: dts: qcom: sm6350: Add OPP table support to
 UFSHC
Message-ID: <tzdnkjnq55ea7u7wqjvn6kzaobau6blnambiass3y6wezqgshs@otgiuusykcrz>
References: <20250314-sm6350-ufs-things-v1-0-3600362cc52c@fairphone.com>
 <20250314-sm6350-ufs-things-v1-2-3600362cc52c@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250314-sm6350-ufs-things-v1-2-3600362cc52c@fairphone.com>
X-Authority-Analysis: v=2.4 cv=JO87s9Kb c=1 sm=1 tr=0 ts=68c937b1 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=m3AVSQT7pDQk2eD9g64A:9
 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: bz9-I9Bch-DYT6l3X_ROvA6vctTW2BEX
X-Proofpoint-GUID: bz9-I9Bch-DYT6l3X_ROvA6vctTW2BEX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDA0MCBTYWx0ZWRfX+jK5LbJ98meV
 5dtlihEz//mdApJLNARLvHI9FFgq45/3piTsVh1hN4V3iB0d6rtHTlVt3ZWtWwqtcktsihZIVTs
 v4qY5BOp/GsCYa7aPEpbknh2FQ8R2Vfwm2u7nkBmvNRpl/zabFQVwDgy1IoHwtqPX1NzLWGCx32
 O9G1pLL+Bwrem5GHaYpe+S52pSaWioDUzsODtyRNXED9EFSIAJNFF/IiiXm7xm2olc7ArK0kXkj
 8cCfQpW/+f5/8BpwjxquL7Y6V+Ibl5YEProQ4a37Vc1tdqQnQHaFBNMKOA9zumpSuSfTwVPcXUn
 pz+UZKBgYbXHLg/7WCYRjpsJwf5pJawDBygJWyKM+I5kXRMKsCqUmQAYervizY2d/bkV+MQc4So
 iylNT78r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_02,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 spamscore=0 clxscore=1015 adultscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509130040

On Fri, Mar 14, 2025 at 10:17:03AM +0100, Luca Weiss wrote:
> UFS host controller, when scaling gears, should choose appropriate
> performance state of RPMh power domain controller along with clock
> frequency. So let's add the OPP table support to specify both clock
> frequency and RPMh performance states replacing the old "freq-table-hz"
> property.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/sm6350.dtsi | 42 +++++++++++++++++++++++++++---------
>  1 file changed, 32 insertions(+), 10 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

