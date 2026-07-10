Return-Path: <linux-arm-msm+bounces-118311-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id X+NcKKn5UGpA9QIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118311-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 15:54:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A31C73B781
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 15:54:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ZVJWk4u3;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=HJPv22vK;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118311-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118311-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A7B6830719C3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 13:52:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8196264617;
	Fri, 10 Jul 2026 13:52:15 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E070229B18
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 13:52:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783691535; cv=none; b=Oyjt3j9OFqWVm/N4acGuxUOo84eBhZiRTFZCFNnpqUUCVQAXfZz7nkAUMSbU0+65kteMU3tSFNFM4qDwdMttpl8w7E/syPkrPCD6BtbuOfrDJu57xyWlPOrP/xIoucra1gBtyJnS8oRjgoBZKiOpqdF2jf+s2vmKRk7QaY8Phl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783691535; c=relaxed/simple;
	bh=T+94v/mhf1HExZVucFMd2pkp5EHL9rqN3VfCf/LbgQY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kTPYv7fHqiXtikKNcA44oxloLflEFuoWjCSBR248vi4fsLuHpJcrey+qiXjOPeMRTutVJDYb0FuGeOqbRcjbaGub1y6lmWC7guVjS0GAJp3Xl9x47UvMjUorwRdQr0wtThvGCXLFWgLSxpn3P6axFRwlo1tUAAYv0ny0aDBPQ84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZVJWk4u3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HJPv22vK; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66AD6OgU871563
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 13:52:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yr1He9a3vmYU9JrgMvIeXSpzOub1puB89opc9sNrrRI=; b=ZVJWk4u3iCSvWRz/
	Lqg5zphbwuuc6Wb76ux+UZJtxl8iD5dxHwZCc2OX/pFc3PHPgilSwSvlG1Aip7g4
	dLkY6+4IXbvUX4/201DfdZwukoU/cR5QQ/KrBpBBFXpxLXhlGo8/FJTKx/Nso/fk
	4KJylCLpcdWp57tSY6rvMIrBb3vPTzEniK0q+kjhXSR2y35Td9/ta5vhVTCZjUW4
	mm1+mm1xfeJRBJlR5oogf/jDSS0l9ipfbTCCBGmsYg6bDGrV1SuMrL3+NjEG9ISX
	oLrTAU4FVuA2s+PKVYxcGFOJfnr2EhYy9VEWq0EvlhyVQXbrG92UqsRFLKIOsXLa
	PJHEjA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4faxyg8px6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 13:52:13 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-903694fd3bfso1050666d6.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 06:52:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783691533; x=1784296333; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yr1He9a3vmYU9JrgMvIeXSpzOub1puB89opc9sNrrRI=;
        b=HJPv22vKe6K+jpFUYhKLNnYXr/cPeaUI/TvzDpVVwPVqmx2ln/YUrRYGvNXREzAMX0
         qdSCkooJgJIq2XbwttUsXsSUHlAZXKR4ufJyLXbHGkfc0oKojUssVzgroxHmvClpFEye
         GzhuQZ5O8ixDGL5W/RvHZR9AQHz9loQbNJvaaInrc9w3uAjB1JpBv4F1xpBL5oCEXYxy
         xHKyrHLpa2xgsBYY2CKNCfOCW+cKLbFdCqkCaNSturu3Sa1JH6jqvfARQilGjZN+C3EH
         YZXxu7xwqFBAR5z2BNtylBZbQnSh+LW7Ny9ODXb4eVdgco9+UTLOlSnNTeBIGF+W7DfQ
         pfZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783691533; x=1784296333;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yr1He9a3vmYU9JrgMvIeXSpzOub1puB89opc9sNrrRI=;
        b=WszuCOAlGjv2safYpe/t+TlK7R7k4i/K0cqKah+U64FWUmkm2T+bQpxL6LqyxJqEUh
         6+C1HzTDlDg/RZfF/nE8DsVYq78o07k2EolGNqXEetfCZHSqLk4uQ69S1Bz9xIrhh2d4
         Dhb1g4mvkZrFpAc7+yuV+YxPq+fUyY6ereH5HxzfnaGFNQjvFz4/fFFAfOW9NNOLHcQn
         AesVmK1N5vNdTJL3+En7xZCa+MXI1Qzd0gOjvu0p6aHZoStsS9kCPEaKCGIqetqY29kT
         IVz8bDAUVjzQWaiM1TNwxkE23tacTnNfdS4t9nkONmKPNLDXPDrR6+BEwZwhNLsBT3xS
         Fr2Q==
X-Gm-Message-State: AOJu0YyBRf4iJnwUylHIpAaztcoFoa8uzKSV79bMnnPPw1QvlKNqQdDe
	MqT9IIDas2LOP8FRcKe6pavaxgTw8Wf0JN0g8ek0NPVn5V5zGNkifGXKWFZFzL+fGPy0fatQDl9
	1h7pfe0seMVKzM7tRjnVmtC4fIRUmVg+6hAF0gme+WiFYiCC1ch6FSqn3ZGv7Qk09axJd
X-Gm-Gg: AfdE7clcnICSmvXP+TkVBv92OvnUZ2v3GZg/vs7w6DPnY/PWSl/IAmX34S79KhyxyQt
	mr5I9OtJjEJ8ZF4COXREP0w+1juZEYo/rlk5JR5pNwTBKMQCcqntpfi8qtybCpFPfxRVVBqbgJT
	XJo2J+D1BC3SthIUacL+13+iQUXG+ygAXvSurPnN7mNEz0QO+Seltwr6Hg8C60H93EKuE380vt8
	14Qb2rFijKkFhilC2cHARq/u/sufKROGbTagWWHgzVE2Bgk76YhmQhCzJIa3IkZDlcIDAxoV0Fl
	zuWsaDfVA31HcIV06JtPlm4OfrOUn/J7H9gapBDAfvbY41K1duPIGKjF0rGtH61+19Pi7HGlcvc
	0XbaYR0bmNKHZlfjEEbZuyMlESYAsbI1d39I=
X-Received: by 2002:a05:6214:40e:b0:8cb:e65c:e527 with SMTP id 6a1803df08f44-8fec5b45e37mr105778106d6.1.1783691533002;
        Fri, 10 Jul 2026 06:52:13 -0700 (PDT)
X-Received: by 2002:a05:6214:40e:b0:8cb:e65c:e527 with SMTP id 6a1803df08f44-8fec5b45e37mr105777816d6.1.1783691532523;
        Fri, 10 Jul 2026 06:52:12 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69a19ce4b42sm10856614a12.9.2026.07.10.06.52.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 06:52:11 -0700 (PDT)
Message-ID: <917ae005-7499-45f2-82be-db7341ee5dfb@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 15:52:10 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: eliza-mtp: Enable touchscreen
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260708-dts-qcom-eliza-mtp-enable-ts-v1-1-372020a7a86b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260708-dts-qcom-eliza-mtp-enable-ts-v1-1-372020a7a86b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: FRHegqNBoxJiwiK55C4JAbWKwZxmQH3j
X-Authority-Analysis: v=2.4 cv=PLg/P/qC c=1 sm=1 tr=0 ts=6a50f90d cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=vCPi8hDJYrjmXadnq0oA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDEzNyBTYWx0ZWRfX/cvOqM5cnQmy
 1JWU9jA8BdOvfXw37M6aTYmxrSQxQBaz6K4o6S1i9dBLmpsKrue16kBvlA62C7+yLdF9aGSbHBN
 4GDjnRS0VoeuLx3QrSGG81MGpTbd9Vo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDEzNyBTYWx0ZWRfX++9kDBo+anCV
 Kmdkf7qlZ9dJrsr085oABCLpJhaxuTDF6mCWcTrgdAuBZqFapIfn69uj11001t2np2N8BcM8A/u
 NDo7u1vrOzT+h5v0uQl9erKqXkEIrfiOhK+GN2Sqe3uuqrYgH4+GB095nNbUOC7VLFzRzn3Lj3r
 OcfMVF+S8bsfMa7l/92RE2KGmGhwhqsyDr/EZ/uWqjXaaS5MTiM18/L59Ztq9AEdqNzN8+Exm8f
 2z00xdy3wn/HNDkBgOj2TD2/gC65vW/Wqvl03ftCWRLvVrm0jxpney2Aukw0TfTzEr8u5JWxzcU
 rZ6BrQf3oWF/Xg5/wbh68O3wcQaP7RQ8n9PE4ew/05p0jd4j0MYXfqXxpHvgZdOxR5qj2dAmHQT
 zYoLm5y7ojN9hD+sf+sibo4tF9exoQpx0A6ZLg3pj6G/ljUCtx5phKXbuE6vhSLTg+kQ8HXFTEX
 qYPE2AIZZodjYjk/iWQ==
X-Proofpoint-GUID: FRHegqNBoxJiwiK55C4JAbWKwZxmQH3j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607100137
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-118311-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:abel.vesa@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5A31C73B781

On 7/8/26 12:18 PM, Abel Vesa wrote:
> The Eliza MTP uses a Goodix GT9916 touchscreen controller connected
> over SPI.
> 
> Describe the controller, its power supply, interrupt and reset GPIOs to
> enable touchscreen support.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

