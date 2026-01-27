Return-Path: <linux-arm-msm+bounces-90779-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cGaJIoe+eGn6sgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90779-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 14:32:55 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E148694F17
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 14:32:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1F6B23055C9B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 13:30:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 263D72236F3;
	Tue, 27 Jan 2026 13:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ouiTjnBC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JewEvLCB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29E4718EAB
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 13:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769520653; cv=none; b=re+WJHtDbyGoScWOpEZqMACNxvqB/AN/riZvijBMpekKkur9ewoVr3mah6kSG1z4dwiF2yeWOHvRgJDYEUdbL2OMyLJf+dQcr+U99x4FMGcyHc5I7+ahP3IAsusfyp8DG7DrnzfNyHVrkGelhcZDFpAvvGGNiOkq3Rx9DZEuNEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769520653; c=relaxed/simple;
	bh=nLyGeY+mrXwCdT6qDno9ezbqtQHqV6B20cxxSNBjl7I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rP6JylLZhmrPiuOB8YQxBWuMyh8Gcil1ebt6nS6CD6rZWzeMSLqvpatsCfylsc2wJH0Nb7lpgiCALlzcnOCgJAG/CHMtZ/SlwyIady6et98jPSy0TpQLZ/3Adqo5BbILzUXV5lyB8TO81GUXh/mjUfCV+lSMn5GwLZGqklbbx9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ouiTjnBC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JewEvLCB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60RA0ZYJ3857536
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 13:30:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EbeBzapWrYk4XxUN8tlPlNoAxeaRaczXIGXzcY69ylM=; b=ouiTjnBCRlgznq/G
	3NLafsMp7UV6lpxVFymJ8a5zilid5+9WdSugY9/XzATzwifryEiQDITxLCOO0zzO
	Z3d6uChuEf5N0znZ6+AbXVefXPXo3xGmJEClNR9VtvuOJVAZ7g21DjBaTyzJjp6v
	NuM5drA/8C8AemkUYPmpfchKknKlZ7eIdscjJPkmgJoOkRd7RcOi1tl2Df/rZqdN
	cFGxAWM09PvUgTWtCSAz1c56PrRtZh4OvtQbGxd2O+1eHrkG0sMYW6/WuOGV8Si6
	kqb9Jn2UjX1VKSeD67uce3kmfe5rHJPMBjVA68/Q1KBghREG3OVy/5BWhzLgtau7
	80DrcQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxffs2tkw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 13:30:50 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c710279d57so5528085a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 05:30:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769520649; x=1770125449; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EbeBzapWrYk4XxUN8tlPlNoAxeaRaczXIGXzcY69ylM=;
        b=JewEvLCByfasOHIfjdtVkF+H9TZ/c50GUMIKetIoEnS39WN4bd0teSbTVrsnrtoAih
         jBWE07uj1aGUP1FsB/wbnYd0sAu6RjncAysgPKBOv+Wg4wUvFccd4kzMPzSee4HfHN+w
         Vu7mASaW+0WLmpUiWaF9apE6rshXB0d8B3r3R8LhlpNm2zi6YlMkLSMn9TRvM+zpxW66
         B4+e/bKvR/OQAG4jv1ffiH2bhW80WdDpXPg5OB8okfrv3JF6uyRz6xfOZW9B6etTQmsm
         SbjTEGRjUg3bCazL2S8+pag24Wb2SuhPawvC8k4H/3ff6KN1okTiDiw7bXuZnAyfw5yY
         /Gqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769520649; x=1770125449;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EbeBzapWrYk4XxUN8tlPlNoAxeaRaczXIGXzcY69ylM=;
        b=cfaYRNSIgN6b+j2yDl/Z2LGjCiIsevUCdESuEq3XpRXxrkNw3S/fZA8WCdcDRvoAS6
         Y/D7SGvetAHHOmnwWvYL920hiNyy0xsm4ECmVnC5LvANQOYeSgYxtT3ApSWbaNK2eCzL
         tPOI2I0lKGXcgGtSJqvRIZLljd6bOlYUZE3oK8KxpwQwLoX4agFlxkhwg8D1wkrm00oi
         clisDAiYqWcBpFnyCUXfY+DD5gqWsC4m4wQaMbn8U0TBK7wFLpm3g1FMx2E2K18fEjyH
         DgkNsrF1h/ic95OCdVSpex+673ByVayi4IowvY92h+7otVQ9jNLOjhOiChfQxUeF6oE4
         Hj5A==
X-Gm-Message-State: AOJu0YzprHbNLd9O94kQAiQ8RaXqWfLdF38Z7u9806jzc7p3kwMbO2Xe
	ffq8lWRyJeVVU/4TrDyrDkEjuXrtzHayxDJSsHnlviY9h9AWC2hWfBY4eyKgLAwPIpzCBW9wU2C
	NB7oyjB+Y1hHAM/h8+G6RniSqvaJlE2Z5XlOgnLsjDkO+hS7p9PFkeBqGIHU+ZU4o++Zm
X-Gm-Gg: AZuq6aITTEJVxSEJbfM7a2njvZLDfodA9SWSq2nzMOW6vKH81R+MkMt/dktyd1S+4bI
	WZxVjJqlkgg1KY29qghIIHfZGqPa45JTgZwHaI4D+yKgs8Df+H8otzx6qECs1To4tUqhvzfEdRF
	4Y32pj17erzAzntamIqn2cQD3+SG1uk8P4lOyVHn4eeIDEKlJoeW13TKgyj9qV7FwluHiJG8Ceo
	HG3rE1lVdIJbrIiW8FPX6gdOttSQu7JiiM1/tPkhVKbiZTV4kG6LW1bA6pRK1EgZUILKfouqaYO
	FgAeuPPSFr5/bczg+CMVKQftuhYD6+XUa6obh4jWKQfAbzu/BJKyfF+UJtDIo5WXkZpIG7wJhyG
	mfMp/0zL4WjmYDesme/dbmYkqc9IVuAJKr63uyLjln2NcTSzpc1UIVc9wl+cJTrPQtrw=
X-Received: by 2002:a05:620a:2984:b0:8b2:df32:b900 with SMTP id af79cd13be357-8c70b91c60amr137980785a.4.1769520649500;
        Tue, 27 Jan 2026 05:30:49 -0800 (PST)
X-Received: by 2002:a05:620a:2984:b0:8b2:df32:b900 with SMTP id af79cd13be357-8c70b91c60amr137975085a.4.1769520648739;
        Tue, 27 Jan 2026 05:30:48 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6584b965d98sm6610869a12.32.2026.01.27.05.30.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jan 2026 05:30:47 -0800 (PST)
Message-ID: <537a8bcd-360b-41a3-9a3b-58d6f7e4f0e2@oss.qualcomm.com>
Date: Tue, 27 Jan 2026 14:30:45 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/9] usb: misc: qcom_eud: add sysfs attribute for port
 selection
To: Elson Serrao <elson.serrao@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Souradeep Chowdhury <quic_schowdhu@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260116232106.2234978-1-elson.serrao@oss.qualcomm.com>
 <20260116232106.2234978-3-elson.serrao@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260116232106.2234978-3-elson.serrao@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 5Uk0W4iD0D__0l2XKKPp4xjeuEtRKQVI
X-Authority-Analysis: v=2.4 cv=YpcChoYX c=1 sm=1 tr=0 ts=6978be0a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=Mi7szx8wPLqchxB2UhAA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: 5Uk0W4iD0D__0l2XKKPp4xjeuEtRKQVI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDEwOSBTYWx0ZWRfX48o/bZ+Mijw6
 PPTQhM1ubLVafCKBrQVG4zm4QyMrHmIfprchGLSKk2L9vKx21XkaRCHTNbNU7txm6k+AjVgWCyU
 qWiLRPl1iNL4SXa7GeLKRn8eBFpKTPKlvWLTUnjXOepVsisExCUhZrQiL4YiHIOZ3if8QH1nyXL
 wH+C5cezxqjGwXvxQzqnxRYcnyCE6+T2YdcbWl1zCZi6Ckk/DwvkKdyCB6rgm5BSlTpFsz3+dMd
 Ejy/TfIyHdT6wPH9hbWHUg14DJ4pvQ4Bpi04JuMRFwLOfgYxavvxvjbXlXpopsueUuuisMqdsd5
 HPk0tMtGPbp01lh3fMNljbqbgeB1uyMkltyD1JCqhV+KuZ4afooNS6997OUbyR9emtDa5MYJ5Jx
 y9lmqVzZAEmsAszPe8rgaBKB/N0ufkSBDCdhFJXuaAEU43lOJuuvtwMpUkqfN/75TaNYnnlTKHQ
 30GddOSc4KLT8zOn6ag==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-27_02,2026-01-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 impostorscore=0 suspectscore=0
 spamscore=0 malwarescore=0 bulkscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270109
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90779-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E148694F17
X-Rspamd-Action: no action

On 1/17/26 12:20 AM, Elson Serrao wrote:
> EUD can be mapped to either the primary USB port or the secondary USB port
> depending on the value of the EUD_PORT_SEL register. Add a 'port' sysfs
> attribute to allow userspace to select which port EUD should operate on
> and update the ABI documentation. This is needed for systems with dual
> USB ports where EUD needs to be accessible on either port depending on the
> system configuration and use case.
> 
> Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

