Return-Path: <linux-arm-msm+bounces-100353-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EOE/GvKfxmnrMQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100353-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 16:19:14 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D2E9C3469A6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 16:19:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2B8E530BFC61
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 15:16:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACF073264EB;
	Fri, 27 Mar 2026 15:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AOz1zpxH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SMi9+9Qt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CD4A322B83
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 15:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774624596; cv=none; b=jXg1ACgo+bMr77E1eo6yrcWUaJXwAVf7WCc+mGBN2mNrHwEF7DXA60jPdTHZWpDJZCWjCVnU1H5XLOFU0g63oRvPEcHV9myRgBi4KcflG030DT3AExREPHJquz5mteh3HZIbqAvhXuRx69b6MCai+y8+W+Fuz1vNgRN+a+Twb7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774624596; c=relaxed/simple;
	bh=kESptFBDBL8DIr2sqVbThu0J+cCryhREGbJbLhwgZJg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AozDZcpHONyKKUSkZ3XHhcF1N2EhfZPUDaBe46qW9aop++Ud8xxj2dSbVitrEdeie+LB2Lim25uP6KifaiIcFNh/CzqoTM5ji0XLgtN92v4Knm1512up5jWACWQCbRVgoPC1Nou6+l0bBZx5Bpz4P4jgdIwxfCYR3CnOIBKMWwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AOz1zpxH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SMi9+9Qt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62RDhn5F316848
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 15:16:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=W/COnF2VqwKqDpOlbdgOGs0G
	Wiv6hYIIIWSxhc/ka6Y=; b=AOz1zpxHBbzS9HANypIcQH16CPAxTtoftUzy0CPK
	Vw9ST4w4i05fs101yMnnWgl/sPQJfSlFvevLDJ9AX4vca49hTUwtg2YzCNiz9/3y
	wiVors6xhPIEgf09JMPXKOfl4wzIO40osloMEC7Oj3K8bjwqVuzF69J9QrSLoHkA
	5N3aeU51JpjTpwAaBOsbqcDCkNgLsvHyZ204DcAuFBeSu3gW5jqc5SCeRCVARHFK
	PkI2BEDjwY04Do5jjBppkczbi16BXtbvvJq75Echat0nLM6Kaq8rEjFtm2Kxo2+i
	2sjaMQcAQoLIg1LrcoVD5jQf2XIMlxgXsNBu28s/wSWSkQ==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d59s441ky-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 15:16:34 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-56cf69b5091so1392394e0c.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 08:16:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774624593; x=1775229393; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=W/COnF2VqwKqDpOlbdgOGs0GWiv6hYIIIWSxhc/ka6Y=;
        b=SMi9+9QtxU44dmpycXBV9cZPADkHWZo7aTfaO+0I7rWdZ18g+ovL4DMV43Xs7KXeve
         tNLIJgyViketxgLRjYOUWkhIh1BdH9l0hkyfNGlu0/xXRO+F2dCdYCS/lwqTH66HCDfk
         0yL8b5KdT1FLDBH7juYw3J2H0ysO4qbHqs4hvnWl2xKM1AXwsFQdoNi/v66aWftftVpp
         OCnvKvSIl5DXt8dgzvQ6ZGVSfnxy5uiMtMPwPEBH6m3aKo6QRLV35KJiA1ISkES+sB2b
         bINGy/NmDtkPLBuAO+4Bs0XJpfMUWVIvKpN/sb7S10rde3PFI7MjKsFfnXwpf2z+0iBG
         xjGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774624593; x=1775229393;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W/COnF2VqwKqDpOlbdgOGs0GWiv6hYIIIWSxhc/ka6Y=;
        b=Kn/mC969RZmaZG+4O94JHNcr16Rn+KVmz2z5ZBy+o82Q+qrIGXVP3vI/VCpMEUpFhB
         S++EgrGaMD4MCgViX649PBCjVqt/7SUZt2tsaLF79UKCXwF9dxSzHOdgBcixR5E0UaVZ
         hQg+K+/jhFO+/3gr90Y5m+SKr/fR0DfTFlz2NYicQ3ASPKSaVUNMuHD2erooK1u/GuHP
         Z/W2AyborACNPsTAYA6p8jIawzn2HEFryvlRF5udiwclUdgncreSCbMQuO9YVmRGEf7b
         GnmQga3H1dPb9xaheJ5+6tR1JpRox1UqsfcjDFAIHcpqZR1MW+FAdwR1IJKU/hzJB9EU
         Ud3g==
X-Forwarded-Encrypted: i=1; AJvYcCWFbiVlrm7dQLjsF1QTAlZsanQ7ocGtZ+Wb3zYH3CDIEr7wHtxDw9xgEOVBqp9Y/8Bc1jsH8bAhJVUY4p3P@vger.kernel.org
X-Gm-Message-State: AOJu0YwoIhAvGbEhLvViYddTuqwxxmw6SCNspxSLodQDzFl8UIJKorW+
	o5vOXw2BkEUYK74KuO20YOf8+/eqM+XT6GGoA/7dXQZG1rFrRM+8NTfmr8Egc98YK+WLKO7DbRs
	NUp2SKRDN8qC9MIWw2U+/ATlhhszjFOWJIlGY/JMPziq4smzDXn8nPX98DBx73PpD3RaI7a1rbC
	5e
X-Gm-Gg: ATEYQzzIu2K4xiwFx7/RIfc+RwgZCf6MDP7Xg5NHWHryRA7vxD6aOLu9JfUJ2VCXmby
	M1kS2wNCbRRUiBOVbwq+DQFL9pO06kJHBwqieFzi+Y1Y9EsrtYHlZhO55KtTdEhGizBC2tdQ1wD
	gcBpMWvuAa60aBs0AahGrbrDxEEhI61cnotQ0pP/aAk2nXET2VXEEdi20usrdpy9i0CB94/Hq1Z
	reqnlD1b18+Wp6iSYBsp/ncLqxW/VjcRBeNmtE/mT9fJzzuvANu6pSEW9WUTpTbJT1YsSIN6WIo
	5I1G+NcWtkn/Z7Ott8Ewmsro2Ah3tGOBH5+qns9vYOXI168aV3qBr6Gqkui6NI7nUHkdl/ZZSs7
	ed0EPhpAgWSCJ8V7wShz/Xt+uqZdLzaYwIg==
X-Received: by 2002:a05:6123:163:b0:56c:d58e:8c0b with SMTP id 71dfb90a1353d-56d4a61e528mr1183496e0c.10.1774624591953;
        Fri, 27 Mar 2026 08:16:31 -0700 (PDT)
X-Received: by 2002:a05:6123:163:b0:56c:d58e:8c0b with SMTP id 71dfb90a1353d-56d4a61e528mr1183324e0c.10.1774624591163;
        Fri, 27 Mar 2026 08:16:31 -0700 (PDT)
Received: from oss.qualcomm.com ([82.79.95.133])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b919e722dsm14314839f8f.35.2026.03.27.08.16.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 08:16:30 -0700 (PDT)
Date: Fri, 27 Mar 2026 17:16:28 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Subject: Re: [PATCH v3 02/11] arm64: dts: qcom: x1e80100: Add CCI definitions
Message-ID: <tj5tzi7n7yaw75uuawfcgrkoxnu5dnsh5dnsic5w46lzt42kxw@jd444ivlz3br>
References: <20260326-x1e-camss-csi2-phy-dtsi-v3-0-1d5a9306116a@linaro.org>
 <20260326-x1e-camss-csi2-phy-dtsi-v3-2-1d5a9306116a@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260326-x1e-camss-csi2-phy-dtsi-v3-2-1d5a9306116a@linaro.org>
X-Proofpoint-ORIG-GUID: qygsBDp8ahb8Tg-obqCoTUWRdjWFUtWW
X-Proofpoint-GUID: qygsBDp8ahb8Tg-obqCoTUWRdjWFUtWW
X-Authority-Analysis: v=2.4 cv=CoGys34D c=1 sm=1 tr=0 ts=69c69f52 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=iKs3dpp2RB4k51ZqCjcyjQ==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=Bs3EkrpsXgtF9MbaLHwA:9 a=CjuIK1q_8ugA:10
 a=hhpmQAJR8DioWGSBphRh:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDEwNSBTYWx0ZWRfX6Ig0OzKnJQ6r
 xPQ8DePTTq8/s/a3OmOF/BgXJDWlfGoSG8BEXFS9Wwg7DMKbfIeRkyGP/AHVXy2BWc4zd58JOkg
 +jJ+0ddOhsnxr/EX+WegS43JxraIwYwy27GOolj0wsPf9G+tV1V28u1HPwCEwTvSEuqtnIQ2d0E
 MA65KMIMTNBi32UJBluHEQHu6M37jhJiP8X0u3NwmmAQrWiyQbd1QDrdvCGiGpWBiDnvX9BPRE5
 20iE0wc1PDIAJk2yBzXXQsIFNDhmTm17xAYAVnFgN9XpkbAJkUFK1VozUBXS366DR4GTMjPxM2I
 WVh/hYKTBjHmlII79cI/CdsbjmpOoBD3jzBFYtblmSRFuzmkq1w8B9J1LiLx/mlmaB5uSp0YLOn
 e7swL1/ogOx447eiEOrDJuSXxUSWbXpoUTy3w27Vyq2oIEJaGPdpQI/BwwZo/y4wTLMiQbmb+UW
 rGVXPEIejsA+KA+K9eQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603270105
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100353-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D2E9C3469A6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 26-03-26 10:27:39, Bryan O'Donoghue wrote:
> Add in two CCI buses.
> 
> One bus has two CCI bus master pinouts:
> cci_i2c_sda0 = gpio101
> cci_i2c_scl0 = gpio102
> 
> cci_i2c_sda1 = gpio103
> cci_i2c_scl1 = gpio104
> 
> The second bus has two CCI bus master pinouts:
> cci_i2c_sda2 = gpio105
> cci_i2c_scl2 = gpio106
> 
> aon_cci_i2c_sda3 = gpio235
> aon_cci_i2c_scl3 = gpio236
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

