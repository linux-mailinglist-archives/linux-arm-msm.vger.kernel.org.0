Return-Path: <linux-arm-msm+bounces-91526-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MCUSG9PCgGl3AgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91526-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 16:29:23 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D7A51CE3B9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 16:29:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0C4E33078073
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Feb 2026 15:25:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6403137AA95;
	Mon,  2 Feb 2026 15:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X+YOTxhb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Til4ER/r"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D262C21ADA7
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Feb 2026 15:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770045903; cv=none; b=A6O1IxJqxfFzj0o0aS4aiUUlAP9htUu19KSk272a+Jmbj4xs1tunUXKZ0wXzrEwZvnxo4n1EPPHsT//bwyZe3i12KlhywTKFh9LcRo+83HgUwwHY8dA/FR8iiixsUgRs3xbiu6xKrSEaA2HMDTZdRABuuS9Fzli216vMMULHCZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770045903; c=relaxed/simple;
	bh=cnUMvF1PGIRf1t0CxKMPC1P23K+6Cf8tF74KE/1zan8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c26d+7feeQCADXkHceu8FwZz6IB0dVOOuiGYSIXGV2GVWfopeDKSnwuvdU6fWapDEe3oBkNYE+bSAWmivyXLE4nMLekWTZy+9L1XYYTW0UBrf19BRd11xJANuKSt+DNmmZTpK+T1k/C2ZNoRgrq3qsLIA79L+PIDCRubTndN5dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X+YOTxhb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Til4ER/r; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 612E0b891657605
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Feb 2026 15:25:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CfsfjKt78QKfc1zdfZTCrfPCx00aWxfIwixUT2WLb7g=; b=X+YOTxhbetc8MWer
	B0VP/lCfmJxKcF91DZhFc0zv9h1Kh/t/m566CMU05wblLXjLwykoaJbk22Wnl96Y
	KU/QfY/CSZ9tEPFeug4LYkQsnwlXN69jK+E7m4WSdahZnbcKz3F6dN2xhsqK8irb
	JE084PNXYJBaXiY8hsqqrN/Rpmdl5XwF2wCim/RhrMKXi69ncKBSKqvnao9FP+Hy
	kZZF0i5LCAEULvtUPSX5OTUmtdJANC4AlR1wvMjijzoygy8Fz0oO3Qpw0GuGgjYF
	Q8PL7jt9nKA7M447m9kZ1+QGb30Ove/i/32ph0aT+zO97fH/lkRMWMtgkPmqPGx3
	Se1Bcg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c23h1kmmn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 15:24:59 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c6cfd52556so1450860885a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 07:24:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770045899; x=1770650699; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CfsfjKt78QKfc1zdfZTCrfPCx00aWxfIwixUT2WLb7g=;
        b=Til4ER/rNpsfx3tgg60AQIrEq2FCcKtPHiQfJVzvV9DqDYD67XxGHUWlGb1N7lV82q
         C2loALVrTrjRuOGNQSsRbuOS7GYUmccIhFUBvaKUod5nKONXSF3HbxgfXod0TSKOC7+9
         wKoX75fdJhgZQTymXXHmyawbBJEk6YILCoojmKokzHaJJstBBwXOnhhCbqkCE9ui3JMk
         ksCVHsH0fXFx1ETXOAZA9s0TfbLebeEJ2nQelq1KBXIJ3sMvt8+AcOGQLsKSJen/O97n
         Exf03tfjGbEZfFNjMbkl/pzmfzOegO60RoFuDNOFU4vBksvgTSPIeyHh1u88IZdFR01q
         tH4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770045899; x=1770650699;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CfsfjKt78QKfc1zdfZTCrfPCx00aWxfIwixUT2WLb7g=;
        b=OXZAMxR5qDeGZ9nBcUVElQw8Yt4tEqnsxqpMJ3SiFB9xUstWpKKJN047eAoYohSOT8
         XTkhdEfIE/w0Pnot/a4ysHhElY8IvU2SxiBF6HblX2zvp/dwk2oG8JvRS1ru3U78Iy/Z
         9MiO+Zh6RG19VgEXf+inNXO/xtta7avZy5GK5Ly90sHUs6xCXT4XUiqr4AAFy4ZkuYcr
         FhwieRTWr8OBdG/1+lioY2WsJREgw5zb96fT6FQHougPOItmQbRjtTsHFNY80qzEtPdv
         3auQAPz+PF1Cc5Q+IggiVIIE1UCtx+20Kp+IRNddXQefFj6ChGX7oP/5Cz5KyCq5lJD7
         rk4w==
X-Forwarded-Encrypted: i=1; AJvYcCV7nPwUwDYpTTtq1GYbDl1m39sFqi9OZKef8HHEjPA1IQ9iF1ilOnDWYfhGwpZuJvF7MdcmAAy/TIU33HNf@vger.kernel.org
X-Gm-Message-State: AOJu0Yxypa6QbUKLFdIiGrsIz1dCBHzNQWW7q4Ua54tR/XEegrRqJASj
	1QCYo3fbHB0z8VF+tj3fY7qjV8p7Rq8gCJp+vXyZ7Z2c2IuRJjIIVZILR9vlMT9/GauWoNpnQ6o
	i+JQPRl/HGGeNMIw9MeuUYKegevGbkZktB02xnPpcDfN/s51lMAQh70lDZkqSs26c2jQ8
X-Gm-Gg: AZuq6aLwSAi05P0nRkeshnv6NWYI4LCtyTWqnQ4W6+GX8US+pjb+EnCeXw+B/psU065
	nWo+7+d/Qmkx4WFdHmUNXlJHfg+Rg71CRBs4ID8GPsf36jYmoOvtdD/RppAHEZin3KaJlc1lIsf
	ttSRd4lo0gmzu5M34KoaBi3A6k8H0log9OIb6A78qdeuZAN5I5dXpRIwY30F3bg1gZ6XY/H4aJw
	U57ks5ssXEbiTkdZ7K2iXgy05mlslIHsFE7/kmdRJsQ3/JU6UcwwPrj/JkFOP+KrykFL+O4FmOx
	WooNrJqdnFFNtC7WaWwvhjLLmDPDOmQwWRPbtBXkvr9/do7gsW5+QsvrkKOjllQ8WaNEIferVHN
	nClpqZP3SAht6IYLqWWbtMr6a
X-Received: by 2002:a05:620a:28d6:b0:8c5:3412:3aa6 with SMTP id af79cd13be357-8c728b6f697mr1737909585a.42.1770045898774;
        Mon, 02 Feb 2026 07:24:58 -0800 (PST)
X-Received: by 2002:a05:620a:28d6:b0:8c5:3412:3aa6 with SMTP id af79cd13be357-8c728b6f697mr1737904685a.42.1770045898072;
        Mon, 02 Feb 2026 07:24:58 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-482e2e3bf18sm98417115e9.19.2026.02.02.07.24.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 07:24:57 -0800 (PST)
Date: Mon, 2 Feb 2026 17:24:55 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: YijieYang <yijie.yang@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v5 3/4] arm64: dts: qcom: Add PURWA-IOT-SOM platform
Message-ID: <uys2yweo3r2pxasyeg5rg35g54tmob6pyl6s24tnla7wcglwe3@omafpc6gmbmw>
References: <20260202-purwa-v5-0-1f5a93578802@oss.qualcomm.com>
 <20260202073555.1345260-3-yijie.yang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260202073555.1345260-3-yijie.yang@oss.qualcomm.com>
X-Proofpoint-GUID: WqjX2xYZp0YqHOtw9zn1JoMTzDfu3iBu
X-Proofpoint-ORIG-GUID: WqjX2xYZp0YqHOtw9zn1JoMTzDfu3iBu
X-Authority-Analysis: v=2.4 cv=Fu8IPmrq c=1 sm=1 tr=0 ts=6980c1cc cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=HFdUuuCF8L9kRLeQQEgA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDEyMSBTYWx0ZWRfX10X2/SYqodpk
 jH/LK046O18Bwl9krlz+OQmMUurTN47f1ne2N4hA5+tTOVnBabnv84gPXnuUi0BeXSYCryKqKvQ
 k27ePpz3XHDFgzqfaBVikFBMUwzbbZXwrCShiaXPrJsXufxitnqcYAaQ2uAZ0wzl8dyUa1lTMLN
 pj+izfzmYAWs9XNGwQQTZjwzzYx9/3dAULVSUtxkJC8t1xp6w/sh+8KvZPDuHvvJ51if6IJLhwA
 CrQNO8RH16kMDdu/tGTiD+qjWQAlVWLGeAnUQ/t/wCxjl0T/ig2fLlR0XUsywxmerSiPMiK9UCI
 4faqftU9GSNpEgYjiAjUarQDBzL7++kR+xwiAxIgShsxJqiWoGIsdCIBnYXMb06bTEG+hOHwS/F
 w+/cDRdMN+km51w3FS/Tq3CI0zrgoT39D7OEBbVslJxCcd7tco/2U/LNn/PZLa/OZxl4svL51si
 MBaEHTEhFJu3F8Ox6wg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_04,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 clxscore=1015 suspectscore=0 bulkscore=0 malwarescore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602020121
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91526-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D7A51CE3B9
X-Rspamd-Action: no action

On 26-02-02 15:35:47, YijieYang wrote:
> From: Yijie Yang <yijie.yang@oss.qualcomm.com>
> 
> The PURWA-IOT-SOM is a compact computing module that integrates a System
> on Chip (SoC) — specifically the x1p42100 — along with essential
> components optimized for IoT applications. It is designed to be mounted on
> carrier boards, enabling the development of complete embedded systems.
> 
> Purwa uses a slightly different Iris HW revision (8.1.2 on Hamoa, 8.1.11 on
> Purwa). Support will be added later.
> 
> Make the following peripherals on the SOM enabled:
> - Regulators on the SOM
> - Reserved memory regions
> - PCIe3, PCIe4, PCIe5, PCIe6a
> - USB0 through USB6 and their PHYs
> - ADSP, CDSP
> - Graphic
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

