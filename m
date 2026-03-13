Return-Path: <linux-arm-msm+bounces-97488-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iF98BeQJtGlvfwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97488-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 13:58:12 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3497328357E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 13:58:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7BCDF30879E0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 12:58:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16DBB37F72B;
	Fri, 13 Mar 2026 12:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fw6s9tIx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h60wwW0M"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C8413932E5
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 12:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773406686; cv=none; b=GlDWG5ny18Vggem0PEq7z7SjOKLysW1nXLartxG3DMjeDeGvVmVOdVB8w/eDRpe627J8o052vfh44Nrb1QQsrIIs3s9vB07VsseMdx48YGUlMhfLckZGlnD5zMvn5C7f1FuNvVAZAkAw0rNU54TahSc4WieBTbTyjOC4KtkXI+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773406686; c=relaxed/simple;
	bh=MyqNZV4kLPyL+KkBjM7DQKFlw5piMQTaOiqhQm3Rfu8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FeO61+1BpPj3Y0yclPpFsffCpEG+DoT3KJylcE2CIhZ2viC5rYgejVTdGkuUgCrQQK6ZNWAAWwQitilz2J2c939oavZJVgqXyjhBL27yOYsegI87Ed7z/axoXO8LGgG+qBcEvvXmVWUntpuE9b3qf3P/QygUfQNdtvI37fVG+sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fw6s9tIx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h60wwW0M; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D7JmVO241596
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 12:58:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qjWxh3bFSUoQMyo0hJ03HjGFms6uNt3s23pwaTXBU3o=; b=fw6s9tIxoLz0NPzo
	E0MFFfwVYMmIqcp2OfLullq43DdKFpia29Fo2dhz1iDDXGJPZTmL1iXX2gP+AGJq
	i/pN24o0ackgL311/q7+BTwAGQiA4Gepc7RknjaqrAlrB9rWQGb8kpSqWPrZ2uPx
	dEfAGwcIeFN6gJD2IDp0oC/DU7SOGlEg39g5HsRqExNMp1f2Vt0s2EUmTBCCufU7
	/XohfSxJXzFn9o6zEzS/OgVS4J3FblcTRXaV1RQfSiwKApHWIIqWwE4C3bIzlqiU
	Pxk4spv7TnrEzwwRX1jBBGRtJTFAsVcn7aIYuUESh52fWSgHEIc+b04WkyLQJDOC
	LmACYQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cve3d95md-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 12:58:02 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb50dfd542so116845485a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 05:58:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773406682; x=1774011482; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qjWxh3bFSUoQMyo0hJ03HjGFms6uNt3s23pwaTXBU3o=;
        b=h60wwW0M2Rh4kyD4XHZ5SvAEqU2A5lBJes/tOHYo5ymIEidh9KGN7j6zExWICvOSNs
         2L72M7Cfo6v1f7fwpZp9d53dntRFjoQGJmJh/LedY8a/2HZL61ikTmD0B/TizoYQcdhC
         9affiZQxd4cdBXA/NeSAh2oC8LffeXMXiQYaKaFG5gSuknE8/siwk2PF42o4b18OUQ9/
         WlbcYRm77TsyE1TIoTKrqE7qoUbgjdA37ak+mcAKLSk3tDewgsEnw5aYJZG5MMtRZ/Ek
         6cLSjV73ns1zfISQtc0QtqkNLp7f6jRHj/PIgjvKjh+ne6DPT5lg9dkCtzy3+Zg6CKK5
         X9wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773406682; x=1774011482;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qjWxh3bFSUoQMyo0hJ03HjGFms6uNt3s23pwaTXBU3o=;
        b=QW6VHu5rW7zXEa2Oo5GjPzjf3lAbG7Ff17HMTWeJEcuoqCvN1nkldMjRVwcCgKvB9j
         4MKJ4TU9s3Q7f9MMncrCkSE88kMzqeiR0MW5PmyxrUGuzjZJInT3aQOkH8tGrGh7XPvk
         X69pckaSm0I+T8/JLNn4ax7+J/d5JBqsb5nbdhvVth2yQ3C1xcrAazQmnws/ZKF3Ovjf
         GDwZ//4XT5ENM7WqjawaEoZeVVOI7shwQVL42bBcYlcdRHBbaRCzZG4+xBEanN69zyff
         7LPn4mX5HoDtcSE7KYoV0O9unKFjU7eHe0sIzPPArw29QXtOC4DwXuIgDavm9G8Sx4V3
         cfQg==
X-Gm-Message-State: AOJu0YwM60KJ+pca23LOFbR+D+Y4Z5825lIfxb7kWZcqqQoCzGJKaXsX
	hennVVfNdL5cHFSFWDT6kLTVGQoYAxFtHsLWPgFqzDB5h9L8AinB0g2EzWRXDfZalpe4lVaQAGU
	E+xr9lCdgdtTfBcH1xdTnJoWU7b5FI3LSepxRrtYdyrVOWAlH65HIEYoG0K7RlahQKrqo
X-Gm-Gg: ATEYQzwXN3ClZPZTgNVIv5TAAv1IGakjEKbzpq7YYZ7Mr3jU5ioF6aCBczICrmr64yK
	rQNI6s4PlH1iutsmqjlP67KCT+UsoQ2vPYmWp0t0RmCh4eJyz6+zlmEF5pXDLTrMbCEcmE06omL
	2xljurmjc4e2i1nZjYyuUwlnmN8F4CBVBXfSbQcecGGpKcsOpnzM2yon2hpGamrzWZG4SfRBZ9l
	Ef9MLVCcFEFe5ngtHBxgGJyEiC/bjOxVQhpAhEV/TEwYGwp7Dq2cE07a100d6ig7Izkedz6J21Y
	z9yiwOCOiYUr5Wjf5XyVAx8iE0zQDVZgf8e8n6QYbb3mVOfxrtPk/RTRGl65CqEbp5AtFKjvWvk
	DVGWSxHO3mU9gircynZfcfvd1Itf8NgUUr0znGB0l7aJzFv7hop2WZzsMcE3aZ7UkGTqp2rQ5t8
	cwVyo=
X-Received: by 2002:a05:620a:8e17:b0:8cd:b6e4:81df with SMTP id af79cd13be357-8cdb6e48634mr197173685a.6.1773406681459;
        Fri, 13 Mar 2026 05:58:01 -0700 (PDT)
X-Received: by 2002:a05:620a:8e17:b0:8cd:b6e4:81df with SMTP id af79cd13be357-8cdb6e48634mr197171385a.6.1773406680850;
        Fri, 13 Mar 2026 05:58:00 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66350b86008sm1212444a12.28.2026.03.13.05.57.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Mar 2026 05:57:59 -0700 (PDT)
Message-ID: <4ac54faf-e27b-4907-ae8a-d3ec910e8040@oss.qualcomm.com>
Date: Fri, 13 Mar 2026 13:57:56 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: glymur-crd: Enable keyboard,
 trackpad and touchscreen
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260312-glymur-dts-crd-enable-kbd-tp-ts-v2-1-2277bee4c564@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260312-glymur-dts-crd-enable-kbd-tp-ts-v2-1-2277bee4c564@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: LcKU2BgzdSYVadN3WcqPAZywlJISjhCY
X-Authority-Analysis: v=2.4 cv=FLwWBuos c=1 sm=1 tr=0 ts=69b409da cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=c-Kx7w3T0iWJJxMe-8gA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDEwMyBTYWx0ZWRfX/KHOQ5oE94C9
 6YfG7pBv+G16RzRxaxcO51gmMj6wNUfYtxVeblNWmTOamNmN3gMm+9Hj1GOk2iCr41Gz2C+rqVJ
 80Er/EcziULnMkQGzyDlTwJc3nAiTURVfk+bqGjadJKUldh3nWsQbainR0HZnWRyjUn/kWm4n6Y
 0FXfwHQa+pHWxEdAheg9ahsqvpTifvPZvKgYnuMbjq/X1JOjlFqwuK53VWTHZpLoMmD7teUiTF2
 6B2fNDrnjNhktAFx4NXXZYMGhKCBrwEj6ezr3+LIIVE9ETFvqJS+u2uXn91wN4vF8TLmEeak6Dw
 QP6yI2i7wqdBYazj0EjJRsbF06f0TluTmFKBe5A1pMO/NsYuC6/eCFkqWnNy+iAKDN4a30N3s5E
 YQIk1/pgqKZ1r1StalUqj4qzkU72MfR5lDg1oCOtLDGk3c4XvqZ5Oxeo1pahQ1aZD69S3QSu8jf
 2glX0VZz8uXzAx+JE8Q==
X-Proofpoint-GUID: LcKU2BgzdSYVadN3WcqPAZywlJISjhCY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 malwarescore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130103
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97488-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3497328357E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/12/26 2:00 PM, Abel Vesa wrote:
> On CRD, the keyboard, trackpad and touchscreen are connected over I2C
> and all share a 3.3V regulator.
> 
> So describe the regulator and each input device along with their
> pinctrl states.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

> +
> +	ts0_default: ts0-default-state {
> +		int-n-pins {
> +			pins = "gpio51";
> +			function = "gpio";
> +			bias-disable;
> +		};
> +
> +		reset-n-pins {
> +			pins = "gpio48";
> +			function = "gpio";
> +			output-high;

we shouldn't need to drive this pin by default (also missing bias setting)

other than that:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

