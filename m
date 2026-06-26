Return-Path: <linux-arm-msm+bounces-114716-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zWGLAXTmPmr8MgkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114716-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 22:52:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 63A796D017F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 22:52:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=i+V4AI96;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=YwPlTOAJ;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114716-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114716-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6AC8230038EB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 20:52:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95C433B0AF5;
	Fri, 26 Jun 2026 20:52:01 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62F5D358D37
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 20:52:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782507121; cv=none; b=IUYcaq2TXdl1tLV+ZaPYAuR2MhBy1y5/M1NY32Cktq75yGfd+Q2BXsIuxaeYU5d4bjarKhbrZ+GZQFtGF50TPitQWez43UBemhaF0Kia1iSy9ofn3pEft8JXxpX1e+XnpFm7jN876bCuHtZHQK6sr8Qa31C8qz2zgiO9X7k+JZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782507121; c=relaxed/simple;
	bh=glTje0SHGKlC2O0ypUPh35USbtgkKD62Pb/EXcf9JII=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KUBhEmNCcU+ksCfvCeXZmvho2m6XMVwza7VHHdMh/766m+a2ixyg7KxneL1uyOaGNzDgQqkep0aG+Itklwoph+5ZVveMRv6ca45IytgxAyCp/pn2IGgdENhcKUbDJrfSu/v0vv+AR8Tm3+Bacmg8Vv6e9g5awV8ZKOtut6wL4Uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i+V4AI96; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YwPlTOAJ; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65QJ8gIp2005188
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 20:51:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=IKOnoEyFWDXwr7o29D1hxEeo
	ex+IYcsFA0olkn9Z9N4=; b=i+V4AI96BKmhrDCEqgsvg/u19N9C6xGtwpqu9FEp
	QtMPLsEnCOV/33NhzPQeR5WIIARh5oLOe9uHSthJhdrmrlEPt6wYz6BXVARACBrV
	V+9lWM5a7qV+ljPGrui/E/6ysaq+BrtZiNRn5TVssfLIuoY/WYF21kXEcKAvWZm0
	M9f4+5F6bsTlS/x+04XG3n11IqAkkhzVFG5lMyFO7GolA3hSGntVYOBkvFLSGb8x
	nEZ5izinMXi8mD/ooejaBcruN8jjh+zPBldgvH2TjW97PcVvn/IC3dCGOJYgjIp9
	zQVy4B0C66Gl/uu3ABJ1I0+KqhMPQfgSKQ/PPW7Q1DUVHA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f1wsdrpxj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 20:51:59 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92b0cfd4a7dso155560185a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 13:51:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782507119; x=1783111919; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IKOnoEyFWDXwr7o29D1hxEeoex+IYcsFA0olkn9Z9N4=;
        b=YwPlTOAJLaFNtyU+rgc9DPm5Tdh3fSFVdgz07tqM2FMLwoi3u5mElKueXX4+ZTd0K9
         HhEVXnvWDEVCJEsGfxgJw1VlkfUT8qx8fZPBiNKcqmzJgfFJIR3lJRoTGFybso1tOR2e
         MrDXumHguzyyn97i5A/tBBPmSZsyk8AQMp2q2qMeiziDLu80TPQwGfomDSUofFTZ2l2c
         x3H5znIZJsluY5oPcH9hOaKJ9ZlJFQrIlPG5gUHQrjIP/wW2UmljS+YcOuaaFwH8r4Rs
         Ehyziv7K1YcZZNW/8bZ4rIJhXh80tXsash/OVIJKVnM9IULtut9WGToBpsPxjKnh5VaO
         vFJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782507119; x=1783111919;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IKOnoEyFWDXwr7o29D1hxEeoex+IYcsFA0olkn9Z9N4=;
        b=OibIwcavm0O0tJQW8+H5O9he22aYOuxLwnCd7yDB9Rd55JxBr4LL1tbJho3MDWFp3o
         f1nel0rwy8tovm32qtiCtixFToCwFno1Mpsa6AK6PivYDVWBsmgwbxvcCI9EqyNux2Ae
         4d/J/UYnKP7IcfNEnBwpBCL+IN3vK2Hb1rw4yiLmHw6yNAk5JW4By0ztJTGWHMAy8y2C
         qwu+NvCfnI5J2VjmM7sb/d+2guMPXO5WVO/GOy7w2V2sHDRkMR5ht1b1csGTlCilq1XG
         bcEG5tyj6i3r9amp/ikmV9sSFWfle1jngCEmgwnXSjCgOr7uCyCH/SMM0hOrAA0NvZZX
         KCxA==
X-Forwarded-Encrypted: i=1; AFNElJ/U3MLLZe8e8IFfv+Xhyl01bo9iz14pnpdxzXY0ltgjhL6TrPqL66zk+n3lds+2fp369voQYN6GAOmo8aCI@vger.kernel.org
X-Gm-Message-State: AOJu0Yy81G1J3rGTiKKfS2xmiLCDuafp72K9ZjpjZwZx7/e5nfXwmsSX
	TtBCviVKWIWFU8VvHQDgUdNgRxi2YiOWxn94xLW6ybXiblVSHNQ/BomjqxUDQiJ5uozp1N85Fvy
	XmoY+wIgipIp7fTw/w0lhufuzjncE+0aLncZg3lT+T2gHgO+KQUMJ+5GX2OvHSutuEPuvyBQDYo
	P2
X-Gm-Gg: AfdE7cnArJxTKQ/A+LyUmtP6VpHUl5LfTYtLA9hQWfZff++R73TL8IazYCj3gOujDqM
	cj71aAD6lVvWm8HzQy+PBG5K+Tv9wULu9XYdMGXoaRwjVKDfZjuWdyIoMRo/rjKdMrCu+poFHWM
	tT7jRh5fraIHP7bZQmIfQf8l5h9bMYepIBoGQLGCdUqFQMFigKHgZ1YOt8PEGWhl2BkQipsL3RC
	7c63rzcbgE5zOi1AnTnDI2l/p6nHzPMC72JuPhBHQIjCoNsP9x0VXC9CQkqEb1+VkELO9VFNo6l
	597Mb6o359Fx71vVv6qbprPdrk6TMmnYow1v7obalxPJ6xtQ4yIKutUXcxZFEYqTke4vpS3+zmd
	vnWTw5k6zPapPAvWMY3l2QkF3jD4rhns+lAxshdboCU1OQ2wFvgufMaA+HH3KHCQcJjhuJ6TqE4
	v2OvZjq9wZFD1uNhY2UB3dzSoQ
X-Received: by 2002:a05:620a:471e:b0:918:4737:ea8f with SMTP id af79cd13be357-9293d3a3332mr1308465285a.54.1782507118631;
        Fri, 26 Jun 2026 13:51:58 -0700 (PDT)
X-Received: by 2002:a05:620a:471e:b0:918:4737:ea8f with SMTP id af79cd13be357-9293d3a3332mr1308462485a.54.1782507118261;
        Fri, 26 Jun 2026 13:51:58 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3999afcf08asm56901861fa.16.2026.06.26.13.51.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 13:51:55 -0700 (PDT)
Date: Fri, 26 Jun 2026 23:51:52 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mahadevan P <mahadevan.p@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mahadevan P <mahap@qti.qualcomm.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: kodiak: Set up 4-lane DP
Message-ID: <dquxvlawcvggc3lml2twudquio7xy7nj3p2w5atcjeliueeyxf@wn26uoiz6l33>
References: <20260429-kodiak_v2-v2-0-c3a703cc30eb@oss.qualcomm.com>
 <20260429-kodiak_v2-v2-3-c3a703cc30eb@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260429-kodiak_v2-v2-3-c3a703cc30eb@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=RNyD2Yi+ c=1 sm=1 tr=0 ts=6a3ee66f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=5DEvdoOZ6e79lswV-sIA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: RWsxUneyTfL0PJKtlELvfWxAbTtHINjm
X-Proofpoint-GUID: RWsxUneyTfL0PJKtlELvfWxAbTtHINjm
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDE3MiBTYWx0ZWRfX6HIpHwGN/QY6
 ulSeiJjJyPPenBw6Ydybks6c2blwjCLYVV1jTfuKhM4YOprrLE5LCBwkUYD6WkGgICgUq6xk+jG
 jlVbxDLc5kVpbtonXrGLAklQavqE36o=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDE3MiBTYWx0ZWRfX3Xq71Cd0x0jh
 ABWS5qRhnZR8Hb/KchA4Bodsbfs0cvTZ4/lQOYT9RUvzc7/QmvLzhtd431vxZmA4DMlYJmg+E99
 GoQTKBNm32kdZPMbgrpjdNN4XOiqX2FNgY/rNAMWpNff5Lh62hHWKaV6D+DW3lJ+sf43Iu0BxaM
 AUjiS6BeDpcKnRhDzVk1Aw19ZEPQsGRhZqTqD+pE7Roc3PQvdegnq2pz6rj6+Zr0dUFOx+Z46s4
 SVlrb/heuJXrorSmKm8Q6zhqadBDe0ISrLPlYhmfdz6dMBinTCgtyo3M5GifCWRO5O4IHS6IJl8
 elqmAl4IcCvgKYjT/xMBXRMMMcQbC+m/YNXxe872t5H6/mgacWtk20UglFBNXtp02f0sP+NaLl3
 MpHQTsAJzkPy6kOyxUNFaYJYFLKizuPWavWQyHFN1jFGXg/1pjfebhLF1f/wM+QVvFFiXg+VDf5
 zbjOkHFmUqL8NN7s+Uw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_05,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 suspectscore=0 phishscore=0 impostorscore=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606260172
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114716-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:mahadevan.p@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:cros-qcom-dts-watchers@chromium.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mahap@qti.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
X-Rspamd-Queue-Id: 63A796D017F

On Wed, Apr 29, 2026 at 12:10:42PM +0530, Mahadevan P wrote:
> From: Mahadevan P <mahap@qti.qualcomm.com>
> 
> Allow up to 4 lanes for the DisplayPort link from the PHY to the
> controller now the mode-switch events can reach the QMP Combo PHY.
> 
> Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/kodiak.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
> index 0acc6917d7aa..204513a6bd89 100644
> --- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
> +++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
> @@ -5704,7 +5704,7 @@ dp_in: endpoint {
>  					port@1 {
>  						reg = <1>;
>  						mdss_dp_out: endpoint {
> -							data-lanes = <0 1>;
> +							data-lanes = <0 1 2 3>;

So, basically, you've force-enabled 4 lanes for all devices, even though
they had 2 lanes enabled only. Don't do that. Squash it to the previous
commit and enable carefully, only for the platforms where you actually
know that there are 4 DP lanes to be used.

>  							remote-endpoint = <&usb_dp_qmpphy_dp_in>;
>  						};
>  					};
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

