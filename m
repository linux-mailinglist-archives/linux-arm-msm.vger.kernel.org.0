Return-Path: <linux-arm-msm+bounces-104453-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gF9hI1tX62nkKwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104453-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 13:43:23 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C18B45DEDB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 13:43:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3B67B3069032
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 11:38:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A7873BED0E;
	Fri, 24 Apr 2026 11:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hACnsWia";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NWG23Mh2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE96C3BF677
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 11:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777030717; cv=none; b=lVHvW526xJ5NRkRbBUJ7narBB6CuWqSAblfd8Q/9WcDGkGMGtH5tLy8kTZP6q13XLV0IGbJTlasguhJBGoe/qx/ur7oVzXr7+VaHTacEzM7LBITDVe7q4waTLvFebQkGLIGXXCBBCg6BX6H0oN1dgWygWg1n9RehewGdk5ZoOaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777030717; c=relaxed/simple;
	bh=rSzN7e9ZxTD4WFp8PWPh1T4J7BMP4rhtRQfSs1Q03mQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eXlFu7k3xf+aDdoCvx6qv6+Fom6DrICB2woQdMtER3FNO3QvgV9EjRNbLm9SH1V0mCNgWEK0B3hZ+QQHTF2IMBwcF0eD5ngzIEZmekB8u/bVsKwYLT3s5OKveRdbU3PFJD2O5IFpjv3llRZwuw90YmLABkTVWgsmbyIjbSh+qnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hACnsWia; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NWG23Mh2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63O7Z8xv4167699
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 11:38:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	h9FXDcM9ShZue+YfwyPXlcCyFMROuqxPANRf9uVstsU=; b=hACnsWiafhBTdTxa
	ZulVo/IH0FqF8qq2uuB0Ilmzo5C4o68OJHBWBjSiEu0Rb2dKg3JZ23giI7Z7SiO/
	5ZgE1Iklx5NHlGj+ncObqv5nKtngkYDfbA8lVY4Kp0JZvw0vLHoxgdzJN/tlDG8d
	Wup7PcReU+KoMQMTLVjPi6NSHfgRrO/ufQxsNfTlmhGdXa12M1LNKCIyL1lvDKCm
	/C9r0KMb5GD7IvdaBKAGWrDVwoXsKEuitA4OXOJkiphPf1Xq05OIvH5+p1gztmc3
	d7lq7uhvhyj2L3q6kj8N1jJ4K0kN5MYgQn4gKcxzk7sWSy2ycF0wQP4NEirZchbL
	LkP26g==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dr48n12hr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 11:38:32 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8b207ec027aso5355646d6.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 04:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777030711; x=1777635511; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h9FXDcM9ShZue+YfwyPXlcCyFMROuqxPANRf9uVstsU=;
        b=NWG23Mh2x8fLQ0MLePY9re9cjk/TIJ4UcHwxRTOgGsnEia47tkojVMCI0hvRbn3Jwv
         JgYUiXitU+TGr0QdmaITXcF6hVK/NeLQhtu+lEmSycBPNo6+MX9S8XZCRYXSWPy3/4jb
         2vqLE7gMsY9eM0Aieyz0tB5osQflYn/fNddAcUEQ8V5UorOPE2UKleBZ9l+USj+eSNcL
         iNnlPSmvfHSo1Cyil6LiFkRdqcZM+UEjRa3eKTxtvd0E7N5j8rFkY9K0dPaz0l+2D6p+
         6EhzKlmyQTj/IbVc7nojyfAtN2EEHcMIWe+PBEY40U38r1afLF11I9Cd0UPc504gF+58
         DJXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777030711; x=1777635511;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h9FXDcM9ShZue+YfwyPXlcCyFMROuqxPANRf9uVstsU=;
        b=UKtUeD3l7qnXvvmYVmQQ+/SX2bfOZTciNORWXLPj3Mbp5BGTUQBPpU1ix1jyIK6DiO
         vZCNrn/Ry1v4J3hp9Pk3RnZWkrDA06DhWfC6uPJ74GNQlBEMCTEqAw8u++ePh5JwW0dT
         bl8fcAA4iNnsX8sGHv4TyXuTF1i8rMgev3qEihgxTaV4ziZ/WiqpfVJ2FMAn0CSLoZiV
         jXUaNw/qvkyUNsEz120vWYs/DYHy9um6QFLcwrbNLvPMdWnFgW9r/XdrXBMhN2sHgddc
         zJgOSqqkwa+adv4nSrQiK7kct/lnAbb7e3njOvgxDkH79kfjWki8AC5O4U/kQxplGMWg
         rxIQ==
X-Gm-Message-State: AOJu0Yzvletu9sjfsXcLAjXzqPlUa5o85wBVcMDS8UXU4/kDHp6uIUzP
	Izp9PnGYDuJJqibRu0wx3V7bsxqTvdDWitl1Z5X/kdVEuv0lKUohJZJZFG2zFiIOrejenRNWs71
	wyB+pB5p5Xh02V/P1bEVsNEI3iinV+h8oT0vTd5uoBNPWE2tKb+cJ6d24anKPocb01e3/
X-Gm-Gg: AeBDieuQyvm3MYRLXNkMzCllaDbE6KW+1UBNXg1ORiw4ZBQJGH0eNR4hW+4gPQtHcXV
	9x79V2FDSkXxvaqUdjqPMskH94AqWUknhSAUOhi+b4apgcRjxPVUfWUiF2H7J2Ba35QJTvpAphK
	lwvr530APJQz3JyVrqLcTX3lSWSBp1YRFPO6vE7SwvpgXjVPzECiF0yeTcPtIb/jqV+pV8YtlRP
	/Cs7j88ta56ayO68eniuiNMaPcd8FlMqgMp/evuhI7D1fBjOeha3sNSQ2R0BwtpSkdZmusRkZFZ
	OStP8UKfkxQ95Oa2EJKPUOXxPpUomFJE4hqlRkC8elCk+ho7IIT39MmbdRk6dsFZzmHPydlLC4U
	OywTxd/YusXrbZTzUDKBREDC9ctHdeS8EGqzqaceQgXW5SakZxmlz9HoOFsEr9YlsYDYKzSZIwR
	vdqbX7hKAWyao1qw==
X-Received: by 2002:a05:6214:21e6:b0:8ac:a797:ba39 with SMTP id 6a1803df08f44-8b028002f45mr356871086d6.2.1777030711659;
        Fri, 24 Apr 2026 04:38:31 -0700 (PDT)
X-Received: by 2002:a05:6214:21e6:b0:8ac:a797:ba39 with SMTP id 6a1803df08f44-8b028002f45mr356870736d6.2.1777030711263;
        Fri, 24 Apr 2026 04:38:31 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba451210e54sm777016766b.9.2026.04.24.04.38.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 04:38:30 -0700 (PDT)
Message-ID: <74c5344d-93e9-4842-9704-9d0c4a608d5a@oss.qualcomm.com>
Date: Fri, 24 Apr 2026 13:38:28 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/12] arm64: dts: qcom: qcs6490-radxa-dragon-q6a: Drop
 QSPI node and reserve its pins
To: Xilin Wu <sophon@radxa.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Judy Hsiao <judyhsiao@chromium.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-sound@vger.kernel.org
References: <20260407-dragon-q6a-feat-fixes-v1-0-14aca49dde3d@radxa.com>
 <20260407-dragon-q6a-feat-fixes-v1-6-14aca49dde3d@radxa.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260407-dragon-q6a-feat-fixes-v1-6-14aca49dde3d@radxa.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: sLH6T2F4O85leSjEuCw53oiyps-N0iru
X-Authority-Analysis: v=2.4 cv=VOjtWdPX c=1 sm=1 tr=0 ts=69eb5638 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=ksxQWNrZAAAA:8 a=EUspDBNiAAAA:8 a=VmJRAYmLPqqtz3Wu46cA:9 a=QEXdDO2ut3YA:10
 a=ZXulRonScM0A:10 a=zZCYzV9kfG8A:10 a=iYH6xdkBrDN1Jqds4HTS:22
 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-ORIG-GUID: sLH6T2F4O85leSjEuCw53oiyps-N0iru
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI0MDExMSBTYWx0ZWRfX1VuNDY9P5Ve8
 0ocARUwSRdZBQbvUlUM4/9Tx2SkE1qW1xhMbbjdgHEt0qZMsODclwJIdfnOYwOnssxMc/qltcAS
 a1KCJjznhvTXZNXU6k9VpGE043Jndi9g4m34Y8A3XNj366l8jjJP9kyVAfyErxIZ8MDfkBHeFnS
 eSOzikchB4z4K/j+l64cBHXoP7rNhbcghP5/gcqATAaJNudVrlGOVL9DSVNPU0CJg/Kt5JFkydi
 aE/fZ+5GVj7ltIrZ1X+iKO7iv7htfdDvae84qnAdrnzrxcXPyWutPoWX/R8GWyKH5mEwBiimHMg
 ohGpM0pqPynaVV6Ib3/W/VykKUM+Rb2sZkEckLeADWfsYZB3w9Pv6YZrAgY56tPQDJKheBYQQtB
 A95Ib4XpigRhofyLD5S7V99N+XWnf60w40RvCLVfxmWTiozEXfRLQeSfbjlfOiQIJgW6+SqdDCV
 4T9EXRXdBaDDMd9ayUw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604240111
X-Rspamd-Queue-Id: 1C18B45DEDB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-104453-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,radxa.com:email];
	FREEMAIL_TO(0.00)[radxa.com,kernel.org,oss.qualcomm.com,gmail.com,chromium.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

On 4/7/26 5:19 PM, Xilin Wu wrote:
> The latest official boot firmware configures TrustZone to restrict
> direct access to the QSPI controller. Any attempt to access it from
> the non-secure world causes an immediate board reset.
> 
> Remove the QSPI flash node and its associated pinctrl states, mark
> GPIOs 12-17 as reserved, and protect the QSPI clocks in the GCC
> node to prevent the kernel from touching this hardware.
> 
> Signed-off-by: Xilin Wu <sophon@radxa.com>
> ---

If you're going to stay with that flavor of firmware going forward:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

