Return-Path: <linux-arm-msm+bounces-100781-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UByfOpJgymn27gUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100781-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 13:37:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 456C035A62C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 13:37:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 67D873008A6B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 11:32:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FB7137F019;
	Mon, 30 Mar 2026 11:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TRu0VXaM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S0fsOl+7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54D0A38551B
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 11:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774870349; cv=none; b=iW7q5K5YFhegxEZTs/E3AFAsHZHA2i1f05y2MZ9AseN3ePNZc7WBgfoLwxrzmxeE83sYQiGv3ohDoCMQ1PAMvteBPACEz2tSCwslVeK4jFmQw7PrYG4yHWObP/5WYFlJYz8AxhbpLBvVkjvhP25gUuGlqqg2PsFy07ZG9Os8Aic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774870349; c=relaxed/simple;
	bh=22P+jx0cCRgKBJdXU/lXLBOvBYmLNvB0It8vkQu4yRQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WwxrczJd4rmKqPPT0BU65t4ARULQaBY0UzVyUSN0AGoatgvBSR3R5fwgku0TgGbIfEXytJ63JeZPSHfsW+JXjDe8woNgugNgug2EiedPb3onFOuKm4o1LgKQuTyVmJDcylDEiNLwTBRt0YekaVnj28iFVoCJk75C+oRl8eYIO6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TRu0VXaM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S0fsOl+7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62UA2BIN1756012
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 11:32:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aBjuPeHvl6MvjopVqIkxTFBhnqkYc2xa4MlTY2Lqz78=; b=TRu0VXaMWBu5cShb
	gNV4o5vS2jOMy4bDZIen5gDOYwOlvPoPgGg7uYnzroxFh9JDWa7AAacCH2TA1LZe
	pb/sZflsdZb9kobkAcSqliWWgGD5qfLU9aT5IVW2MfgonspL6X/qJKXO/nr4Rc0L
	qbP75ndVTMc+EGUb5rE+88kD1QT55z9lV55zE0O6vHxmSwesESi2l/ZK7WfkLInn
	m5KTY0SOvcM1RbitGrjzxTieYB62LaHE3mZSZwoXCB/IO8Vr3tx1X2nBfcFb0183
	V8RsXPf9BsgcmHsDN3uMexbxdut2QoCgTH8oBeBoHCb+Pef3ywrU0GyNZ5W+LhUU
	JxleEw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d6ufmm1hf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 11:32:27 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b4ca7e7c2so112159981cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 04:32:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774870347; x=1775475147; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aBjuPeHvl6MvjopVqIkxTFBhnqkYc2xa4MlTY2Lqz78=;
        b=S0fsOl+7F5xtDCLhwAqJzMWiQ9CStyXwCPxDN0sJQIWb7HpVY3g+vAyBBJt4MfK/Tv
         DssZ+ZxkUc5LQ5MeB40YOm4zOYjbGrhOOjUWXM9AJZOmQdEDHA3oVJRt7Psdfq1g3aoR
         QiqaHtINheHcVExm4ePuiHfa88N4sWhjn89grSya1bDev5wrjimHklusiw5qcOgqaweM
         KlPKr8iT2ZH3JjtL0hKe31K8Mh+2ageR4lV8MVYLwufT7SxO+L+sh46dufiAMj/8IUHK
         u6wqdJua7NWQjtMYketii487cB+Gf/MoRzsMVeU+6RLFZUBzRQpX3EepD5X72CTaOc/n
         pZbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774870347; x=1775475147;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aBjuPeHvl6MvjopVqIkxTFBhnqkYc2xa4MlTY2Lqz78=;
        b=ZEN6Bul1o1nI699LnA9+a82cqIQ90QEDaAoekA0v7ynvBOtGEXUgLHo2SNorztERHB
         PgWtoMNgde83ikzRJ38ruR8itwoCw6VXPr3DVfb1zcwFf00OhT7AuOvDa3NLLbmYKCZX
         fdMm6Lqbhh4ADuw1G8I7Jm4ORNCMj1C3uLIeIWtGo6dJOYWrcy+Dj968fjpTliAG0reS
         r08Ttw5/MudWOSsuvBCvBhCP9Y5rZP++gLcC+DMalbfCsNvZCPJoCxUr+qm1CmPZ7aJ8
         YMthlm/jCxW/q0hW7Vr9Da50wmgH8mrZU7OHm7qV1t+rr+bCYwFW3QkX+8rvpCahBBQn
         s04A==
X-Forwarded-Encrypted: i=1; AJvYcCW8T4BsKd7dW3FBUdayQlUx+4TdXuj9ZwunCMP2ISOU3fARx48ldCspyQabyqVHkGct/7Ue8XwQjgAD5MEp@vger.kernel.org
X-Gm-Message-State: AOJu0YyGsG07tzKKawBj+jNkvHkGqBXrTZm10eMsIWsD7BdKQ1ymZdLQ
	jJIQ1F9Y4yx2jHHcsTd5v8H/T3CDA809r3xh32P0pMZ283cVOXRECHfseQcjblxU6DIrLVa7IDh
	PiqLqoOLS0KHDNoy556G7xkFXuML+eMd9sZk9vIrGagTD6IJhAbkCa9v+Uwv5WccRIMXp
X-Gm-Gg: ATEYQzx6QR6ee9JRIEDxXBgpLB2FOmsazKzvwxxlCDf376PuT/SM3uXnsBRWDBAxJhJ
	lkbhrQyyGYuOa0Y9juhFsKDGquxOdab5vPNP48CAqVfcN8Ja+S1T6IHF7C3kQ1POspo46+dy8vD
	polW723oeJsImexqnfpY4Ttwt8BWYYj1rYeWy3aJamdDNnxuAgfyk/aRQncC1QsAM3PlpI2Xsxe
	mZSslRUjGCIOFpACc8K6T5AnqBOAXezlBtX6hEMLmagHuFpXMoNiV/8UpHCAVAJ7xFdGfAL3i+m
	xtvw4z3k0OU9V9LDjtUoahdd7B2AScAxnLR61vZA0/9b55WdpZT7/3AjtDABzZzIRHTwddfD66T
	ha7iLYep87wqJnq3W4YAe3MKeEcUXu/Czu/WsUhXUOGl+W2bbOorhLeVaBhOKlr9GP5dXq8/80E
	ir6o2bbT+bRQnsrnk1UP2xp3u9dENVGqIAxmI=
X-Received: by 2002:ac8:5a11:0:b0:509:379b:d4d with SMTP id d75a77b69052e-50ba38167b2mr166649731cf.16.1774870346573;
        Mon, 30 Mar 2026 04:32:26 -0700 (PDT)
X-Received: by 2002:ac8:5a11:0:b0:509:379b:d4d with SMTP id d75a77b69052e-50ba38167b2mr166649011cf.16.1774870345944;
        Mon, 30 Mar 2026 04:32:25 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2b13f426csm1599765e87.7.2026.03.30.04.32.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 04:32:24 -0700 (PDT)
Date: Mon, 30 Mar 2026 14:32:22 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Aaron Kling <webgeek1234@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Teguh Sobirin <teguh@sobir.in>
Subject: Re: [PATCH v4 3/6] arm64: dts: qcom: Add AYN QCS8550 Common
Message-ID: <fbpk7dm72aiy673r2776pudw2ydpdirr6bu2rwvceour6lgwdx@melipr4mhv5i>
References: <20260323-ayn-qcs8550-v4-0-33a8ac3d53fa@gmail.com>
 <20260323-ayn-qcs8550-v4-3-33a8ac3d53fa@gmail.com>
 <7d6c2c58-310b-4194-8159-8ea56ed9465b@oss.qualcomm.com>
 <CALHNRZ_tomry+tJh8g2mCZBM1XQcaA7p1ycK03GH1gPQy3geqg@mail.gmail.com>
 <78d7d85e-ecd8-42ca-b59e-b7fbcecf1502@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <78d7d85e-ecd8-42ca-b59e-b7fbcecf1502@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA5MCBTYWx0ZWRfX4CVHta8zq16C
 pUsfKyXXdwcV3MMzSBHXRkyIFd4dYxORTFAad/EPZcIEYwXojGZR3CQ5HQ8ss/EwL11CF98Anac
 0ew5sYr2upU0TmUbl6vepEbIaQrkXBxDAFirEK2QayRtdwK1N/whw5jVs4Ha3M0ygrV4nirAZf9
 3b93HvX05rLO6YM6FsLxP4uoxD2J94WzfnrStVryF5XGqO8tpvUIXlUwL+vQVHQrRYdR5GzebGS
 gf80cKEYn3+d7URZmjFtjyxgX8Whm1kchlWRCRbAmPW4PLQJFxXQqFloDr37SCx3LH0o6+zAYk4
 6GkFhbch//r4thWnv1QuGchwAgCpva4TBsjBgJxXh70SuTRajGQg46jDC5LkiuLltIHm/Ux55AY
 bzTi60yNqChlQH0xD1aQcta7REpGAWUMltCiopakw9dsb/Nj3DGQCVL9qTLH0Es2XRtaU5Vj6IV
 LXabVxtIHex6Ef85uHw==
X-Authority-Analysis: v=2.4 cv=aOT9aL9m c=1 sm=1 tr=0 ts=69ca5f4b cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=5tAmg9hwAAAA:20
 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=ZNzx5AqL15oOLpdYr_YA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-ORIG-GUID: 3EDDiHZo5lW_BM-Gai0JvrvbDteLbt2c
X-Proofpoint-GUID: 3EDDiHZo5lW_BM-Gai0JvrvbDteLbt2c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300090
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org,sobir.in];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,sobir.in:email];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100781-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 456C035A62C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 30, 2026 at 01:00:55PM +0200, Konrad Dybcio wrote:
> On 3/27/26 10:26 PM, Aaron Kling wrote:
> > On Tue, Mar 24, 2026 at 7:36 AM Konrad Dybcio
> > <konrad.dybcio@oss.qualcomm.com> wrote:
> >>
> >> On 3/23/26 5:27 PM, Aaron Kling via B4 Relay wrote:
> >>> From: Teguh Sobirin <teguh@sobir.in>
> >>>
> >>> This contains everything common between the AYN QCS8550 devices. It will
> >>> be included by device specific dts'.
> >>>
> >>> Signed-off-by: Teguh Sobirin <teguh@sobir.in>
> >>> Co-developed-by: Aaron Kling <webgeek1234@gmail.com>
> >>> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> >>> ---
> >>
> >> [...]
> >>
> >>> +     sound {
> >>> +             compatible = "qcom,sm8550-sndcard", "qcom,sm8450-sndcard";
> >>> +             pinctrl-0 = <&lpi_i2s3_active>;
> >>> +             pinctrl-names = "default";
> >>> +
> >>> +             model = "AYN-Odin2";
> >>
> >> Is this enough of a distinction? Do you need to make any changes to the
> >> one with a HDMI bridge to get HDMI audio?
> > 
> > After this quesstion, I tried to verify hdmi and am unable to even get
> > the connector to come up. The lt8912b driver complains that the
> > connector doesn't support edid read.

Looking at the driver, please drop lt8912_bridge_edid_read(),
lt8912_bridge_detect() and lt->bridge.ops assignment. Those bits are
lame and useless.

> Which per the current connector
> > node is correct, none of the devices list a ddc node. I am trying to
> > investigate this further, but vendor source release unfortunately
> > appears to be missing pieces related to this. And no other current
> > qcom device uses this bridge to take a guess at which controller the
> > ddc is on.
> 
> Go through the I2C buses that are enabled on the vendor kernel and try
> inspecting them with toos like i2cdetect

I'd second this suggestion. The chip doesn't support EDID reading, so it
is (hopefully) handled via some existing bus. Does downstream handle
EDID / HDMI at all?

> 
> > 
> > On a related note, I'm not sure hdmi is covered in the audio topology.
> 
> Since this is a DSI bridge, I'd imagine it needs a separate connection
> to the SoC's sound hardware. We've had similar occurences in the past,
> e.g. this on the SM8250 RB5 board (qrb5165-rb5.dts):

Yes. Unfortunately, the driver doesn't seem to implement audio support.
I'd suggest pinging Lontium for the information regarding InfoFrame and
audio bits programming.

> 
> https://github.com/alsa-project/alsa-ucm-conf/blob/master/ucm2/Qualcomm/sm8250/HDMI.conf
> 
> Maybe +Dmitry could help you out
> 
> Konrad
> 
> > What I'm using is here [0]. This is in a fork of the topology repo
> > with aosp build rules added. Speakers work, headphones out and in
> > work. DP works only with the pending q6dsp fixups series, which I
> > should probably narrow down and ask for a 6.18 backport for. The ucm
> > config [1] I'm basing tests on doesn't handle the built-in mic and I
> > haven't been able to figure that out yet, so that's also unknown.
> > 
> > Aaron
> > 
> > [0] https://github.com/LineageOS/android_hardware_qcom_audioreach-topology/blob/ad67f3777b1d4dec5289bc7117f2ec34521be7e6/AYN-Odin2.m4
> > [1] https://github.com/AYNTechnologies/alsa-ucm-conf/commit/d33738b93e9560e8d9e08a024cc84c8055bb7eb9

-- 
With best wishes
Dmitry

