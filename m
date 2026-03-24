Return-Path: <linux-arm-msm+bounces-99755-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eJN2AHIRw2lKnwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99755-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 23:34:26 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 93FCA31D5DC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 23:34:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 52D54305DD49
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 22:27:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDD513C5DA3;
	Tue, 24 Mar 2026 22:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XzOt7dSz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bgJM0KqK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98F9535838E
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 22:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774391264; cv=none; b=DchSTQdiePk+P3sTUWjvKfF80jDvpgaJECQsFesygtytUTdoAEBJ/zGbhxy+HGWxqhgaO2HXOHa5g1Xe1m8bHdgwK0PrDsvgD6G3XD4pIZ4PvI0U7cc51TLCIkVDLcByw0SL7UjVMsyx1xXLB1OUwfBQrxBWzqYGkg164tW/GxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774391264; c=relaxed/simple;
	bh=VFrxFapZMWo+gW+1Bag/0WEOBQGzOBp8zh1WJOANLsc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tnpN9YJRMQlozUcE3C5+VnLE6bvZrNoT2d7ldAvcA5ugGQu8AIdQ13dJgeja97lLaX9BytNiOMvqPfdjMXduk+67KQQZtMlyf9LL8a1jpH7UmgSUimnQmGWRFap5cbohYAXCn1VETza8WlOJ+WMmDr/bp8NoziLrCyPId775FQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XzOt7dSz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bgJM0KqK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62OJCfP9989024
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 22:27:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=d7o659NDRbqQiwXVOjyovY3N
	0yKj36qT/352Z2Pb2RY=; b=XzOt7dSzoi2FERhzkAKrsxXnsr/IqLO4x/5ib5ZD
	7UJDZErlvOhh4vrm8+YC34DW9icPK1XOBdrb3Scj+5bsaqBpEqw/JxfeTOzWW8RP
	63+4fu73kpzljQJW8HASa1einZepaa4sjKk2MUN82KXYXrFSomKJ4hALiBPWSlcK
	T/98rSr+3xeajTs2WtsPari4CymBmL4vvULKFG9N3GnO3c3BUZ5i8bTj5mak6wT9
	z3F+FoK11PE8+ZlyO8M0QPWnujsZ81o44O74JXGJz65Rmv0J2ZwpKXyw+5KhF8o1
	9VwURKg72Tp0DnOio2Mt1AyfuA5jSSGn9ZzRGYRIhFNAxQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3u0m23a5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 22:27:42 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5094ba09affso107383031cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 15:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774391262; x=1774996062; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=d7o659NDRbqQiwXVOjyovY3N0yKj36qT/352Z2Pb2RY=;
        b=bgJM0KqKvt2AeOiM+tM7SkeEIuKmBHfzTCCpGCvUsie7Lzz+pqfQiU/viLR23zhGhN
         2Xvo5bq46PMfktzuY5juL4RLi++pvkJuUMZyQHnFbSywOR79AKWrdHgBBkb+YQ8aUw/s
         92JGokOhXDukll/wuV+A/9zpd7GAVaRdASa0QDQPSs0IhBPRQ8wPm/+8ZhCn9qkzI94f
         EIYERVl++Rj/wt7MoagSr76poma26n6FPGX8WosUxdodc66EWoqfuOSrZX527Eqg/1N+
         USPWgI2t7fBGJv7DHYVmw9VaI9bHhHIdSAsU0tsicZu5lcdN6kOoN89Tqn5qaNBz8j8M
         6eww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774391262; x=1774996062;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d7o659NDRbqQiwXVOjyovY3N0yKj36qT/352Z2Pb2RY=;
        b=HQPkt2KhaLD54S9q6ahJgnVaYl81C/P/Jqt81KLyxWpbrzUXqp5+FeJg6R6XlnD7ig
         igQCMY9PAeOwy/DdVK7rDMBbP54mco3EIAUjq5sC+pnVKmjsqS+Bx2JFXBpgStLVo48Y
         2do0fpOalRCUSsjG2neapTF0uGKia76EgW9P+32Her7WFRrSjL4WxTYDEOYc532K5kan
         Gcu9h3Drta7GCPlpTtg3YTLBYou5KWb9GPHgi4OS3skjhfXmOeaPdVIHqgUlfNmOJQg6
         lU8tI9kHVG/gYkCZTxZHFvRil+i+dzN6vpWYEkcogwkxkMGjKkLS8GfrpQMQDZA/QvFy
         b0Pg==
X-Forwarded-Encrypted: i=1; AJvYcCUp5SwQu3FFN+8u9tWDlbU5dSIkdWEm1CitAawVQzk3PUhLmObJ08p2XKVoCXhyaJwzY/WLnkSDKQ9/+z2w@vger.kernel.org
X-Gm-Message-State: AOJu0YwCLjxciPUF8BbPjWC6vxqGqs2G/HejtWJJwSvEHjKLdWHOsCb/
	qcMBPbvQ95WQ5AJRikSjo59muDuGkkUcH7D6ka+fOJFORqJ63M8GBPx2L6GEwbWVWyywLJn7wk7
	oL3ogaC08S4+iRzefkaBkrqvsTeQjUfe2fKbaUq/UgYfqwfgY2eSAnp0gd4iJJRAEF4ze
X-Gm-Gg: ATEYQzyVPbWHyU2pd9Wr5EOcWTZlVwf/vtxvjgpmAO13s7Nj3BWYqBjcFenqnK4Uvkd
	2sY+p/XFRhEhHsdmvbBol/0B3LMxxM4g4UDBA/ZRvkWMavgJQKZyUtGwphzZxpKO2uxRk9ayUdZ
	sGM4MG84ZqIWdTGygjffEwJYtP/+HxKf2Kbr4UuY3PdBNIhAQG8QQBJWplT0NQsbgoQagpQGZUS
	c7AFIGeaIQlctTjDkBC/AfVgCsn9O1ORr5lbFxKpOaj8SBqPqZdqGUP10ho7uLG2plfFHHoEZZe
	OEoA0LXmgnbb8bJTV3hFD2fJ6wyMP4gOdNmAGIlBC7npw/rDP8kkSVSZ1kItCMp9YNzZ3u1Gom5
	hexIXCmuaGCapL5JHIq/If1FeRYfuL5jTQsNzkiT0984Y1utf2hO3AdTYsmVa1t4VcMRHVGtPkH
	d3LeCPmJUvYi/hY9OGZ5uL9oVq+95Jie0Y3TQ=
X-Received: by 2002:a05:622a:4cd:b0:50b:51ad:35eb with SMTP id d75a77b69052e-50b80d3a8a7mr20870231cf.20.1774391261556;
        Tue, 24 Mar 2026 15:27:41 -0700 (PDT)
X-Received: by 2002:a05:622a:4cd:b0:50b:51ad:35eb with SMTP id d75a77b69052e-50b80d3a8a7mr20869901cf.20.1774391261137;
        Tue, 24 Mar 2026 15:27:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a296d7c93fsm724502e87.51.2026.03.24.15.27.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 15:27:38 -0700 (PDT)
Date: Wed, 25 Mar 2026 00:27:36 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Zijun Hu <zijun.hu@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFT v2] arm64: dts: qcom: glymur-crd: Enable WLAN and
 Bluetooth
Message-ID: <3reeaaukvhce3jm5t6a2zjh442zdcgstvs6rczoyrdu7v36nt2@jpv42upyexpt>
References: <20260324-glymur-dts-crd-enable-bt-wlan-v2-1-6afcf1ac277a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260324-glymur-dts-crd-enable-bt-wlan-v2-1-6afcf1ac277a@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=IY6KmGqa c=1 sm=1 tr=0 ts=69c30fde cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=kcT8zHn9ULDl9SQ3-_4A:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: 6siaJsdI75OactXjb3epMce-GnkRJ49W
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDE3MyBTYWx0ZWRfX/+3LBx0QPOOi
 orPP9W4lLQGLNp8N2B2GyrgUCnGZezZ1LkRMzxkoVUqPGBQrjOYzUXQLG+6IsLLLFJhNOyRGvXd
 C5PSw+gxKQnoNMCHqz7gEDU2l8R3iWdoQDFuU5tJ979p7nSoe0LDCTXR8hfQ8jdHv7bvML6XseN
 YElqKvFeoXe8BLjPgOGkhNCz3wnTOdW3C59ZQhtJqQng2Ih52YVbrlDomwClO/1rG6evUPfziKh
 W68jyVkWo+TN9HZcp8tNZZwsJH9RUraHDrFoXzdHM7tjEZx/OTW3cw0Ni2/1sYlC6oxR+RwBFIt
 WQfxSIS/4Wn3pfqPU0d3KdWVxbphAGWdDjih6miv4wuJTDeDwDXVPxaULUZxWBZCMHeICPablNK
 t4UyV04KEf9XZyXz6y8Xyt1suJHzE6Pb4u2D8RILHnt+olcRHXBeBCx9rM5f6sMCuT9hBmSWYk1
 rnQ7vvPQG4q8fPokeRw==
X-Proofpoint-GUID: 6siaJsdI75OactXjb3epMce-GnkRJ49W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_03,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 phishscore=0 malwarescore=0 suspectscore=0
 adultscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603240173
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99755-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,msgid.link:url,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 93FCA31D5DC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 24, 2026 at 05:12:19PM +0200, Abel Vesa wrote:
> Both Glymur and Mahua CRDs feature a WCN7850 M.2 WLAN and Bluetooth
> combo card.
> 
> So describe both the 0.9V and the 3.3V regulators, then WCN7850 PMU and
> the PCIe WLAN and the UART Bluetooth nodes.
> 
> Do this in the Glymur CRD generic dtsi so that both Glymur and Mahua CRDs
> benefit from it towards enabling WLAN and Bluetooth functionality.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
> Sending as RFT since I only tested this on Glymur CRD.
> As far as I know, Mahua CRD uses the same WCN7850 board, but I do
> not have (yet) access to a Mahua CRD to test on.
> ---
> Changes in v2:
> - Rebased on next-20260323.
> - Address commit message issue reported by Zijun
> - Dropped the vddio1p2-supply as Zijun suggested.
> - Did not rework with the M.2 connector since the E Key is still
>   under review on the list.
> - Re-worked so that it is done in the generic CRD dtsi in order
>   to add the same support for Mahua CRD.
> - Link to v1: https://patch.msgid.link/20260309-glymur-dts-crd-enable-bt-wlan-v1-1-3badbddd5439@oss.qualcomm.com
> ---
>  arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 118 +++++++++++++++++++++++++++++--
>  1 file changed, 112 insertions(+), 6 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

