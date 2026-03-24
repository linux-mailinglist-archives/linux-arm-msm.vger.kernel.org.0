Return-Path: <linux-arm-msm+bounces-99590-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yNp8Ojtewml5cAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99590-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 10:49:47 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DED2305E57
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 10:49:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D88243202AB3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 09:38:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7F1A3DCDBE;
	Tue, 24 Mar 2026 09:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eK1+SB+I";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BpJPCiy5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F37C2C0299
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 09:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774345116; cv=none; b=rioJEJal+5wl/FZ1B4QfMdVhW8BUQ0arIcANRdblz1tnbO5EfS4irsht321yzWh07Cj/V665UxpfDjgkL9n/CxZGWvhqmaQusn+4DgP99SvZykUUzdIt6utf7JXVsCHh1/ToY+PAKqfWMnBB+iovjJd3cMbuk/+GhLYA+EzHMc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774345116; c=relaxed/simple;
	bh=ozLl3/TJGom4/FQ+AzmNPaNzi1EImRBqIdnpnn8fxv8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CbfpLKHmtnvhGPoIKbnevGcrUlQdBbeFKg8WfpEXcHrpWnCUMkTNz9S1YrF1Z0OcbPReXfR780UZITQByky6Pc18S9FTbqC//Fo6v18/wyTrbnv8gJm3Jb4FO5cnWEE300ub9ndZiqkLQTnI2wfTN5jlygUGyQfwuytpHAaeiMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eK1+SB+I; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BpJPCiy5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62O3WT7F3903935
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 09:38:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nfOyLHZYw0jlQu59cpRyzJ/HTXQRAAnlDJMmvIb1ln8=; b=eK1+SB+IPXZiFJGw
	xOjrhNE1TmRI+o+mhnmg5rYXld6nKzpfdmJZbIlnm320zBXgt8eAk2pAabCe/bQE
	Y5W4hR7CbVtdtfyD+MIN0i+kYBLCnoxB5ZHSnuhwRlHgRnA7nBn7CsUJnjkPj0Nv
	n5gh0IpSbULI+LX/MuC5l+kxD+QFMy4fzduV8D188/Y+18v+OQwewPx4hn+YMyBX
	M6N0jFvfKdxnOP9fP4UVUcOpyx3HaisiYDHZbpcrMWsIo81YTP/5de2Fs21edlcE
	tD4BzndQuF6kMwTT1/cXgJIza+ki3LmN/NTKrRHuwLbs3hM0kADhzu4BuVOm/Cu3
	wJNmFQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3jt0h7vy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 09:38:34 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd97debc51so392505385a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 02:38:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774345114; x=1774949914; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nfOyLHZYw0jlQu59cpRyzJ/HTXQRAAnlDJMmvIb1ln8=;
        b=BpJPCiy5JI9j4Gc+p54qt98yfr+nE3qBSdCq8hsIbCi+vZsK0bRVHVVScSFRRKxuLA
         9QnqAjDfW2nl3DUfxkWQZJX0shom5y9GpS1e+9ZcFAUXNOFlQabZo83Cnh/aUjFF0M5n
         4x1cj36wXvDeChnswWaHDRD8rxlBGgchwdddSvka3oF/66LpXZfAOA7asV9hMNFk3iwD
         jvWYi29JkjfSx4A+7LsHv/wAZKZ76yM9P26piwv54Kv23M0bY1fSSwnv+/jsKhg9vpcI
         cW////mCkVWZnQsZY8tSZNSRr9EkkFqGePV/NejSSCkVIf2L06YT7Hr9eR0ABwXeD2mG
         l4sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774345114; x=1774949914;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nfOyLHZYw0jlQu59cpRyzJ/HTXQRAAnlDJMmvIb1ln8=;
        b=MMHtuIgMLRmBVAPdPlV/nUoVOkU/UC3LmxwG1eXcZ3jK/ViiK4ruGgrIlWf/YYlba8
         +KNa1/nkfeVus4VK1J337w+7SmDSvgruKgDLxAThSgaOmOZNUgiCph2Wn7nQ+lEYcn79
         if8fX2I/dEHD+9eiV+nr1XcsdbTXAsWEehapG5ossd/YaegtktdYAZAD2IXVvtCkkqGQ
         Qs54fEPB5xeyfiw263IjH5ucAQiq8uYxjaPfoYoJaxFwtBp6yu5C6ZxRTeibP3U4tUQe
         PMVSBytr2jxjEDCgXCqh7nAByGceR3rKwnBsz/4CiipTHTtUFYDfYt6ksEpEimyisrh2
         BdlQ==
X-Gm-Message-State: AOJu0Yx0KNR5ielyz9MfWAtzJ7ARn+U4Eb2LWCwlc+LJvfHBYw3T9lJ3
	Tk0eyn3xQPgFwnjDCMwjPDKesN6cFVdAtPl+lYLaMJqNCNJa2JsA/90OlbeQriGsUGz0MsYspNk
	kygeJ5/CNJWSXWZX3tMVgJduAxORvxwbeWBU7FiWCwnCdgNtdzz0bmc3AQZbjmsNJEyUy
X-Gm-Gg: ATEYQzxyfjylUMtMj23BbE1+zl49aX0HANU2Yu9ck6KfL1xNqsGsXQlSqlFQ9LkUvHu
	B7/TLk65zqgQPtOnJYRsxI0SG/yYAIpHbgId1uRkejgaLSkPZcg3YvkRJm9hWcTkpmnccz7tGtF
	zttpouYUy9R8kvX9E8czJoTa13oNWLSUhRe1J0ORB5vsOxpOF0fE7cX03NKrJ/KUdh64m/LIx01
	bqYplhC/t0e2ulwKjwEw4xgh+drySpAvau/jklMIgh9P95fd8UH3cjmj5osZVDBfbsDSRDUwEy7
	T/6V21pCE7sdCJ0xVkkqWVV/BpOh9e04RAnYsyK/KhqzKt6tYPwW7qFLAiT+QKysDN5luuxZRIG
	iYxAzu/LA+9pRiVY6IgcFj0bRfAt+dwMet9hzIH6JkqEfRgsZjJpjLY7Fh+jybGbd1ka++B40Ew
	De4ok=
X-Received: by 2002:a05:620a:29d6:b0:8cd:b2cd:ed4 with SMTP id af79cd13be357-8cfc7e9ac9dmr1482205785a.3.1774345114024;
        Tue, 24 Mar 2026 02:38:34 -0700 (PDT)
X-Received: by 2002:a05:620a:29d6:b0:8cd:b2cd:ed4 with SMTP id af79cd13be357-8cfc7e9ac9dmr1482205085a.3.1774345113558;
        Tue, 24 Mar 2026 02:38:33 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6694b45de66sm3117996a12.31.2026.03.24.02.38.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 02:38:32 -0700 (PDT)
Message-ID: <5d02eb1f-8384-4d54-af41-be0bb6ab7545@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 10:38:30 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: qcs6490-rb3gen2: Enable uPD720201
 and GL3590
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260323-rb3gen2-upd-gl3590-v2-1-073514bf9ed5@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260323-rb3gen2-upd-gl3590-v2-1-073514bf9ed5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: S5kYuxyi2mKk8kUYaGRjJAoiB-FtDVfh
X-Authority-Analysis: v=2.4 cv=Nc3rFmD4 c=1 sm=1 tr=0 ts=69c25b9a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=A4rZZFmT0VfpKD8yd_UA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: S5kYuxyi2mKk8kUYaGRjJAoiB-FtDVfh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDA3NiBTYWx0ZWRfX6loIFL3Qyjtg
 TX7ahilDrzgHxFnEIujHopEFbwzW6MywcoPapawZHDdsFm+Q2Au7KfyWILiH5ItFbPFE1Ldetcs
 UaWgxFj8Yg+HAY6mY/Nmn0aMHYWQolLpFqft/3HB2BwIjcILoTQfJF/YzAqTI71UKBkPvlfB6c9
 i8POObIlIOQHZDHnBOahbBHY6z58DqBbQZv+2T+qnyzfJQ8kRqF7EcuW5REpLHQdXNeHlrfsGBQ
 G5eOAfc0CKfTATYAvbPWHgrQJbiLYIJbgXLe39r918plcJSCwXk3IDXrBT8R1ClrVRSfrtbHMSE
 LBwri8NMorVxVw4DeFIBdrG2EyQNiZncWBG2qvbOIj1RoOteDJLbd+K4Ri2tsyRbYoBlR3VADAc
 M9h0gNADwKpmArEUZWdXTqXQmqlyoHl19SS+D/2KCfU2Cq3SV1rzjXlu2x0hJBzNWs/Ib49Zfo0
 vTId/SBhleiEOZKF6Zw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_02,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240076
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99590-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
X-Rspamd-Queue-Id: 4DED2305E57
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/24/26 3:32 AM, Bjorn Andersson wrote:
> The QCS6490 Rb3Gen2 has a Renesas μPD720201 XHCI controller hanging off
> the TC9563 PCIe switch, on this a Genesys Logic GL3590 USB hub provides
> two USB Type-A ports and an ASIX AX88179 USB 3.0 Gigabit Ethernet
> interface.
> 
> The Renesas chip is powered by two regulators controlled through PM7250B
> GPIOs 1 and 4, and the power/reset pin is pulled down by PM8350C GPIO 4.
> The Genesys chip power is always-on, but the reset pin is controlled
> through TLMM GPIO 162.
> 
> Describe the Renesas chip on the PCIe bus, with supplies and reset, to
> allow it to be brought out of reset and discovered. Then describe the
> two peers of the USB hub, with its reset GPIO, to allow this to be
> brought out of reset.
> 
> The USB Type-A connectors are not described, as they are in no regard
> controlled by the operating system.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

