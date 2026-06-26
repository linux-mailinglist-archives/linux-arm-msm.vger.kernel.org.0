Return-Path: <linux-arm-msm+bounces-114715-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /zQXLirmPmryMgkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114715-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 22:50:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C080F6D016A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 22:50:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=DhGLCl5G;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="HjnztT/9";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114715-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114715-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6E32A3006B77
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 20:50:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 269B03AD510;
	Fri, 26 Jun 2026 20:50:48 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC020352C51
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 20:50:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782507048; cv=none; b=iqlae0wHVXOJei5nhAxWW8pZHA7u4GYS2SgqWhzdArAqf1tkJC6xUjXEnbcktOQ/J5s6lGL1gJ7KIDqK37r+pMMEzSYQ2TR7wOku2Mx4VnkvtOSqcHJgdk6ReTwI9OZo9uUT0Rye0+Jj1bVpQSCk6X9SAoTb1+Mft8uIfcshT5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782507048; c=relaxed/simple;
	bh=ZJuNNddE0cO/R8v9f0yf/9VwZLR2weQlqfdpPLjTZjo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i2AwOEp/INCgi5QUhPtdBrl7fJJ4mObgBCVX97+7dGli+Ok9guPwsCPn5fryeOsUQffN9fj7UOjsWjjwXE+09pcbwe5TBCl5Ye7Zo8elIEhUuCsETfB5QzQYfE7SGi4UcJja1s5NFAak1TnKZJDGThQuccN6M4jSR1Kmaw0wEc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DhGLCl5G; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HjnztT/9; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65QJ8XuM1729711
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 20:50:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=TqzuJy3wA3ooJWLi2Y6laSdC
	P5+DXXCzodTafqsunHU=; b=DhGLCl5GnYv5MDcA+KGrXrMFBUSLoo5OtPA0YLcv
	KFZ1NWuZvZx0s45MVHFdoN4Yjt802X48f8xMEkOscyuzcY7JuN63XXke2hldzs0j
	guDc+mHRlUcWkX4dTgO66cp+Wb8/ofxovCDzBkVr+v2x+qjF+Kti3XdTs+FPV1tM
	QGnM4rI+VeO0Z/Fh4yMlfpZapUsgBFFb10HPqF1yc0QatLwTytDT4Jf6Lf40KBrr
	RElVsQefYpBUoeAk701ZuKhGtz3JSCL1d5QixR7RwGtmw4oFyiemLARiekM3fEpj
	TW1MITronVL8ZOZf4qsrCyKrFqiZh6kT5mn6PngFW2gHMA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f1t0qsnyr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 20:50:46 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-915c364ae3bso238779185a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 13:50:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782507045; x=1783111845; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TqzuJy3wA3ooJWLi2Y6laSdCP5+DXXCzodTafqsunHU=;
        b=HjnztT/9Nx1e832VLuvREp/o5fZoL7NggaiysJxRP9ErWYQb/NGZd2oFH0xPl29d3/
         oYJpG00i1GTXSBZ0ksdRv2+HfTLCijQvbjSaWK/KNKwL6Xed0cKmD+8JFoPbQ1cKSp69
         YtQci6/B7eRjokyGw4ttHNDFRNrav06SjecnRByFELmxyvqUN9C9UcWW1nu51jw8nGEf
         O1Z8h1+aB6yaw1YMLtbAgWV2APeCvO9rPO8nCredDwsSPDaCURngidzA7TjA35sl3rb1
         EbqLOGK50WzY/lerm67UieMGyudfxNtKGo23o/F66soXQhR+XS1NVFKqHXimWKn0Wv9A
         MPtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782507045; x=1783111845;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TqzuJy3wA3ooJWLi2Y6laSdCP5+DXXCzodTafqsunHU=;
        b=c7dlFxiSNIbwb4vOWIb6sTDqvIorXuPgLH+o0FL+Id8xmhaGQpSqPcOv0zsbZfonJY
         HzofjttLomRvrD5uR9EJXgDZPVvHUfvlg0UXMNh534WeMq/X/CNNcMj9QDEhxQ89G+q3
         Spn5+S+CH8UUmaGO5aD2lp7sBDmwAxnN6ZxrjtyGxZ2VOEkZry19cBCHkUEbdXJacABm
         C81MAViXAYkT4WOuWv/xRMTkBUhuW7gJn61lbDx3Cilu0Nt1Yf2B0D4Eg60fKyy32ddB
         F8c6G2luuywmqcVJtYG6o1f5ofToPB95zdHcuE+kJbycyfHi+xePNPSInKVFDWPa6M9/
         zjeA==
X-Forwarded-Encrypted: i=1; AFNElJ+C6TFIORkxEW/WC3CjN1xj8kp1dkEKGwkF5P0TbmJ6AH0Mf0sduffZyjoThbUtvfzUr6gDw75agVqfVSEg@vger.kernel.org
X-Gm-Message-State: AOJu0YxB1pKhGLOs4deQvRJySiFc56OluIWyOS3sDx6cZ46uCZ+pBnjn
	1pbTZiw0OPpH2xSInnjZ6vyM6m+aYPIFOQu2Uid4YrNjJ3f2K9CYSxqxz7xgw25xiP5r7yRJWiA
	oOQMWkikzzgdZpBsKvLvSwlh63FGN9DGYoG2QvwOG+Q7XkCQnMfI9/9NEb6T7VpAxCfW4
X-Gm-Gg: AfdE7cnP0TxZMuSXJ/B1rLRYxvLF4YewDXomWaweaAE76GwhHtDCLIYpZiN28kX1gy8
	ob2Ii3+GAMbkkedw96Jx785R7gVLIdG6h7xX00FyofE6pKTmfV4WWRyTCFGS0mZ+ZpXGgTmLndO
	eiLp6J9smNJx90gE6BCVM9KqTFX+7GMXIm80fu5Tu7MO7VxYcz+1pQBPbl0CPauH1NwxnB2MiFM
	1k+E2QK2Zas6xV+h06zzRdS3HBQf9c8kVg6XNSy2U5F06DDKiwIvFo7zZLPJCGDXcnis67dsxIs
	sBII6qJpl7dCnNpQ4GrTd9n956TGuP3/RgigsZVSpSm8JCrttqeXrNGvWPOEVWyQh0srHwvI9r3
	lF+0Un0A/UXSMsSHK8/tvip5+3TMIkTfqeXANUQdlzpFqYyCKdGSZI85Zrx8Cb5SGa+BZgIVbBA
	tOsDrKzwDeTT6xZ/K58xCmjJkF
X-Received: by 2002:a05:620a:469e:b0:915:9229:4223 with SMTP id af79cd13be357-9293d7ae163mr1335511185a.58.1782507045078;
        Fri, 26 Jun 2026 13:50:45 -0700 (PDT)
X-Received: by 2002:a05:620a:469e:b0:915:9229:4223 with SMTP id af79cd13be357-9293d7ae163mr1335505485a.58.1782507044504;
        Fri, 26 Jun 2026 13:50:44 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad69551195sm3678350e87.27.2026.06.26.13.50.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 13:50:42 -0700 (PDT)
Date: Fri, 26 Jun 2026 23:50:40 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mahadevan P <mahadevan.p@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mahadevan P <mahap@qti.qualcomm.com>
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: kodiak: move dp data-lanes to
 SoC dtsi
Message-ID: <hej6absxu6nsuktv7tsegduyrduv7diq5zx7dt2a4xp3pe6gxl@b2xscorilbvn>
References: <20260429-kodiak_v2-v2-0-c3a703cc30eb@oss.qualcomm.com>
 <20260429-kodiak_v2-v2-2-c3a703cc30eb@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260429-kodiak_v2-v2-2-c3a703cc30eb@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDE3MiBTYWx0ZWRfX2EnDib5dG5o/
 sQ3DH6RKjMr11xVddu2igtdJlfUJJgHTUpZKnOPFinu7PKbsfWLH21bsZZ68W6xT0KzdWagdEC5
 4c2oFlktvBSvm6fLcLE4Pzq5QUIufPo=
X-Proofpoint-GUID: hDdOZMjPpDW2tAZjxY2OSSnDBI8RyT3F
X-Authority-Analysis: v=2.4 cv=StqgLvO0 c=1 sm=1 tr=0 ts=6a3ee626 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=OaWc5GozcG0OEvb212IA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: hDdOZMjPpDW2tAZjxY2OSSnDBI8RyT3F
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDE3MiBTYWx0ZWRfX1BkZPQOP0t02
 j/UV9lHATtKyn33GlddDee6cQybV7rEeI64UBcZSkwlJPioqYf8Vvwo41nUiV/zBi0g8q6zMLlr
 DByJEES/bPyE+3zjJYduBHwHlmVqf+AIkqY1Bv8dBOuNyzoDSXapsQQ/ZZ5nQfq5bbLJOEijotL
 qnDTfbOvj7cLqnxKbFnWu0dd+vSmWSCBOslXvkz1GWCCLibB1lVoizlQcoDoDcTtun2HhHNXYif
 2q8OlyU+c64jUQcn9jyBk26YuOqaqF/2GAsLKHJkpHHhK7YmnsUbwqmwsU0dARjfREfuRf5N3/s
 OGWJyGx+YyKnC3TlafTGBu/94uaRSgQA/QqQAZ1ctKGxYkRb6AbYQrZuIkdIoTIQR5wVvS+tmLz
 jPlyW37oTfMA3yL7wRi69G8fJPVG2XKH2Ruax00MNRCe3Ob9lDh5MCmxvlkuHlpVEs9Lgwk89de
 6QxMvk/NOMpvsJWQutg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_05,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606260172
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114715-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,b2xscorilbvn:mid,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:mahadevan.p@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:cros-qcom-dts-watchers@chromium.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mahap@qti.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C080F6D016A

On Wed, Apr 29, 2026 at 12:10:41PM +0530, Mahadevan P wrote:
> From: Mahadevan P <mahap@qti.qualcomm.com>
> 
> The connection between the QMP Combo PHY and the DisplayPort controller
> is fixed in SoC, so move the data-lanes property to kodiak.dtsi and
> drop the per-board overrides.
> 
> Also remove the redundant remote-endpoint cross-links and
> orientation-switch property from qcs6490-rb3gen2 and
> qcs6490-thundercomm-rubikpi3, which are already defined in kodiak.dtsi.

Separate commit.

> 
> Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/kodiak.dtsi                          |  1 +
>  arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts            |  4 ----
>  arch/arm64/boot/dts/qcom/qcm6490-particle-tachyon.dts         |  4 ----
>  arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts                  | 11 -----------
>  arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts |  1 -
>  arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts     |  3 ---
>  arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi                |  1 -
>  7 files changed, 1 insertion(+), 24 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
> index 96ac3656ab5a..0acc6917d7aa 100644
> --- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
> +++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
> @@ -5704,6 +5704,7 @@ dp_in: endpoint {
>  					port@1 {
>  						reg = <1>;
>  						mdss_dp_out: endpoint {
> +							data-lanes = <0 1>;

This is not true. The SoC has 4 lanes going from the DP controller to
the QMP PHY.

>  							remote-endpoint = <&usb_dp_qmpphy_dp_in>;
>  						};
>  					};

-- 
With best wishes
Dmitry

