Return-Path: <linux-arm-msm+bounces-92294-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 3wGyEO3ciWmBCwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92294-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 14:11:09 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B9BA510F742
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 14:11:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B038430160D6
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Feb 2026 13:11:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD0D2374739;
	Mon,  9 Feb 2026 13:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m/3uEtQI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RREOBtSM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75E05371063
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Feb 2026 13:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770642666; cv=none; b=WORDk+U3Or7/VPDM/R7lcYb4399kGioKjlU3HrcYnf+TmdxgsupNHkGuGBjPKf23E0VgyS34GJ2EOAFpsCufetxVbQ3GmbPOJeHdPXxHnBXgwo1qoJTBrG02nfoLOHmCELFuUQ3GL2Fawsh0AVxLGXMI6ZHkv1eXzrFvEjM9jqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770642666; c=relaxed/simple;
	bh=ttosiTeLep3a/0yqYZODsLAArithrXWgifWuWEeKHmM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V52Ivh56lkuFfR2oVVhzcccMqg8ooT4OCZpqHcEANWn1pCcawbO4+tEzWOZAhXnK12yKnoC3XFnD5qtb6y3cYUMK9qHsiH+LycsKFbNIGdB2yoVC9OLpPTKN7TK1WiYPgSeizX1WX1rSTzE7Xf1GmSttduAzhAJi+PvI+gQTa2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m/3uEtQI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RREOBtSM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 619Av4lC1922823
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Feb 2026 13:11:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=RM9D0erFU6KFIPXwqdXYSlNe
	Ku+Wim8uj//nd7mXEwQ=; b=m/3uEtQIilEqacPRJHC0is2psLVesjypc1dGofH5
	61JTO9WyIXj3hfNA6Zw2pwkzvqiqg4TlVswi8N+cP8d+gz2fFIbct1LaUEi6IR7B
	dHGV5dZ0xlGLHY7jSmIicrSTRkgERn39f1sDSZXLdHdxbUYBwMm1fkti3Ht4Yxtz
	bQanQBX7KPfYsdSQ8Lv4RtqrYR53WBjQ0Bxa/XiDK1Qia9GLeWW03/fJDLzoQQRS
	2IyCQVsWyVCgZLT7GCagKkiPv5bw+Hv3yapZXWZjC/8kxECHDDtzHLg8Hhv6RApE
	yHHUpznsK9WcbpjlcT6ab1aEtkdgj7LHcSBliwhXfb8MSQ==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c796ksh8r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 13:11:05 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-948d05765c1so12642048241.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 05:11:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770642664; x=1771247464; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RM9D0erFU6KFIPXwqdXYSlNeKu+Wim8uj//nd7mXEwQ=;
        b=RREOBtSM7Ne+yPMjiGNQLucfgDZ7iaOTzVdCF4Obh0HTRgmhxYK9ScDDI9VUFgbu8f
         8FLTVdGqVVZqUFcPEs7koZph8mJ0ZRGAW/NDtaTE5ZnhQalwLuklIywVgMBJCQbbGB+e
         aKpBHKtYm0oM2+i660E18rPTyQJE0GYnzraTGeFs7WbGwdW5XgPzb8F4chayu7BH470b
         DUMmUTxEQ8k1jYIUIPAfSpdxpqaQWHhXLo+9xhbY2+AIPol7LIY4+zfQVRx3DnaAh/A5
         3BZAOxHopw6svI4iX9c895JjZYT4Z+OHXOOTj4y3GF7xBnrZz6pD9b4+HHTzu1RFlTUW
         Gotg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770642664; x=1771247464;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RM9D0erFU6KFIPXwqdXYSlNeKu+Wim8uj//nd7mXEwQ=;
        b=ANCb/6uGgxvXoNqmxaJk3+CEmNG3PFpPnmWKzpzU5Ix3phIqvTBnEfAKjwNGIHj8hT
         3y28CCO0bCdl8zUbTdvsR3B/7o+Wtgwyoc5unec2qIjLatNiTOOS/YOCHbtycJO4xrdD
         DhTOT3ulWsazBSnY3SLhZQ7kHGInNCwRNPIINWU6Dj06SfaR5IjCqUopL8MYoB97HW16
         qF6RAhbk5LTx6lTOcHJ+zM1KlHVgjlURM/aNROcAhRZ3fnH02CKGfkSO3TwRhgktc9UO
         p46yapntlKfOpdjb/kr0Hfjtuy604S0V9vsQxwqoE7avHkpS0AWgAfJNZRbCSjL0em5S
         tlzg==
X-Forwarded-Encrypted: i=1; AJvYcCX+cvImZi+SSRWnd+8joP/nh/xFRdaMZiPngL/cJVbY2DIR0r/Mui/nkFJf+YWEBgqMIdzdhAisghn/wJKQ@vger.kernel.org
X-Gm-Message-State: AOJu0YwZZEveIppvcP3Xzjp9dXmTW+dJku83PES9XasCuJ8vUBnJwjlS
	rIK7lpJhaMjAnjNI6MlpZAEDTSqQFLD0dFsKk09fYzccZckU+QDAfiyKIrRI9VxskBO7cLDMNHu
	BQdY15ZZEm/N8HyhByOoeBEDYTj21l7Qt946mi+IEBbavKStj0iH5SjGulFm2hD+YYyWR
X-Gm-Gg: AZuq6aIw+gzLmDI/WPgudRnKNa1QvoynLLGucDFBnhcSsuRCK1Z0OEzPkmRt7hjR+x7
	3xt2ls8veha3b0uBKa/uV4qErrzGsswOQ3GaJL1bHl1aLIxmW1sZPOIonoG5Ynw5G0b9vVd6+rd
	cDnMFpbmWxYHoINvcXUyfQSpl8qCuDHEgPq7ux97RWBT9b9+I3kkpcCRnS6Oh3ST3whusk+gDaI
	LCGQ5f45LmUsoH2+WJngRMoiHXhmiYpc83lXIQdFb0qsR2MEzMreDK6L96FMyLMn6bbdwceFqMT
	kdVzGsTNpyCHxnRYsqYzMlnxYM70mJ4pTIJ+M99jO8zYpmDDcqv/J2P99XlnSXPf5ABw1avNHW3
	9Ewf1hEvNHe1+PeEgyFeawXTB3Isd2+RUoJN3GwFOp0ZXRoVdAMUoRzFmUN2q0HwKfpGNEho+Lc
	sECwDnklGXzvTfDRFNEcaziQg=
X-Received: by 2002:a05:6102:160d:b0:5ee:a3eb:2854 with SMTP id ada2fe7eead31-5fae8cbbac2mr3080833137.45.1770642664551;
        Mon, 09 Feb 2026 05:11:04 -0800 (PST)
X-Received: by 2002:a05:6102:160d:b0:5ee:a3eb:2854 with SMTP id ada2fe7eead31-5fae8cbbac2mr3080825137.45.1770642664102;
        Mon, 09 Feb 2026 05:11:04 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e44d2995fsm2635434e87.49.2026.02.09.05.11.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 05:11:03 -0800 (PST)
Date: Mon, 9 Feb 2026 15:11:01 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: Re: [PATCH v4] arm64: dts: qcom: x1-crd: add USB DisplayPort audio
Message-ID: <eop445dzscrlag3lzh7d7erbjoit4d74uwusqs5lykcucgmfrt@u5uyweg5nimo>
References: <20260209093237.33287-2-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260209093237.33287-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=IeyKmGqa c=1 sm=1 tr=0 ts=6989dce9 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=iTZVlg6EzTYP-dx1yXAA:9 a=CjuIK1q_8ugA:10
 a=o1xkdb1NAhiiM49bd1HK:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: NWet0HQBsLhdawq7qmuCfWJkg1nAOl-l
X-Proofpoint-GUID: NWet0HQBsLhdawq7qmuCfWJkg1nAOl-l
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA5MDExMSBTYWx0ZWRfX5JFCxtgQoHo2
 YFocgLhkKzDFjuixcHORv2P2hsqkpwsI0/X+WBH/AMz/luuut/RgufkAWJ55W4VOgJ/ryZ8YNlt
 5el1GAq6iXHcgcRGRMK3YEtQjAz2T4obRBrDtGueCsh7DdbeIGSDC19i8ww/5iCXo9LIlrTi74n
 jw1fZXeNWLw7IaIDK8L18cye/CmEE0a4BPQVV21eRMnVIE/XoqnA332SDT/HQTH9dlYxF/wEx40
 aOK/CB/K5+ZqaNZK/kDgfcn+URmFF73N1tgs1yo5XA6C+g9idQcvVFP+rGviL6wu6S9t0iG2oYT
 kW5XW0Ni30xIzfOcBifdZtMntVYWg+h9P4MqyAVyryHS5IYQp0fy+L+cPWJ1OcK3LbrXhO0ZfQN
 Bu2aR/9Ivc+JwvOvzekmyAetJeGcNuBwo6mJkb8v8pAP9FyO6+ztBPLslaj/pHxPGLgDkA2EMHM
 OA3cqQmyjAZg7Cj19Bw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-08_05,2026-02-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 spamscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602090111
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92294-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B9BA510F742
X-Rspamd-Action: no action

On Mon, Feb 09, 2026 at 10:32:38AM +0100, Krzysztof Kozlowski wrote:
> Add support for playing audio over USB DisplayPort (the two left USB-C
> ports on the CRD device).
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

