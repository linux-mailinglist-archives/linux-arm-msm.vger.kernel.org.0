Return-Path: <linux-arm-msm+bounces-103925-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sFGwFrZU52nz6gEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103925-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 12:43:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FEE0439A81
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 12:43:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6F46C3004404
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 10:42:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43CEC3B8D4B;
	Tue, 21 Apr 2026 10:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T710U8NX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jLLx5Fym"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F33253126BF
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 10:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776768175; cv=none; b=E2coMuj5Drx3FvA/1yU/RCW72nguHZ/aoGh7iL9gDgfBpBKDtCj6iY1ou0bpTyrEgN/Kjgxa98zDjkQVQXPuwCHgqJObVFUIsg0+YqiBw3ONcN1eHdSoIakTHSb/o9h7K95s32I3QqXdIKcoaDfqg0fZqzOrkjTTqyK5cJAL1AA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776768175; c=relaxed/simple;
	bh=V3Sw8xL/k0QNug3YR59BDk1ejOW0G79c1frnvEZvCg8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L6bDnhlO/NmITpVpIHM0r9xv0SgbCqtUO/Iyt2d9DveyCw8EcN8KBwUTysA0U65vgDUOXPMpCLZpeNqJGgZM4rIW/lpdDQzNwsqy995/FVpB4B8MbJlz6JqH1ZrIYxEx/WRLRFMu4/1StiGk2kW9p7RUCZfZTR0bDEi9Iz55wpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T710U8NX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jLLx5Fym; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63LA2kSU1809748
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 10:42:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mIdVNY8xKxle0iaLzoXqxpFUpCZlqEbuqrI0bo39D0I=; b=T710U8NXI1CoU2Gc
	zsTpbAYq62dKS8IYBOR1JPKU/LTR3jVOUbA6A4c/xlyY7rWE1Zc0xv7uzhRowq+P
	PIo4GJxUPWzd5BC8MMHfFDNd8AB2+1BQGjfSLEsAVbjHRzPYvTM9sJNlD5cq6bd3
	uYVnu8/mmEzVH2Gn8m0HQ7TXKHzLH95wK9yx4AkeBYsBrJVnr7BJQMax5siaYAg9
	ST598D51w528Wi1xsmJ7qNToXG83SO77GMH8rrrY43YgBfPgAmLyFXpNrcyJ8zLC
	kYYMj6zuCOwATqC2BNXE8G5DDnGQyE4Yib98qxiDvbi0mApWnAL2tsGwoMBpPz2b
	FLo8kg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dp74xr40x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 10:42:52 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8eb04e1b499so21781685a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 03:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776768172; x=1777372972; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mIdVNY8xKxle0iaLzoXqxpFUpCZlqEbuqrI0bo39D0I=;
        b=jLLx5FymEFAc79EuU6FS1JHohUfA0B5dbPLXTYUccEgtgIXnB4jIo7Qg1nvSjTBxEQ
         GbTnqnaKEvYqH9uXvmE+HTDR0xPJmxu/cCvYmpNmXI8Nb/Euo22Fo2Or8v+oV5ZzCqy+
         HLzxx1FDNBuxQK6RgouFUc2NFBkyijCPUyT4sReRchwn8OoOkRxZOZnt6qMOM/O+4ohQ
         cuytDkaYasW8dZ3iDvXy0EZbNzCrFAZhOV4Zr4yDV5jPZMl3C+Te0WlZ54fXRsm2zsHC
         1vQ4n5Egz085NoAwXx+YSzPdvtagNbdl646v1f1DcrRpp9mlp8VgzS93GrmruWu546h8
         kpRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776768172; x=1777372972;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mIdVNY8xKxle0iaLzoXqxpFUpCZlqEbuqrI0bo39D0I=;
        b=LOED5rNb3UUHpMO7bBt6cTxSX3yyYpJlFeycWRZFBlDVCVAYKoWwuC21ECDSZi5wGd
         5ni01y8Sy+SsR4jwK8n3jJspmL6hWVfINXNhZrM+HYi+imqeIAC9yCRXEXsdddZZ1uym
         xiFpJjgyeA/tUFQY8UGjgpqIjdhSxFqVhaSSiSbcfR0FAsrtg8XukYxg7NUZ2l+EHLud
         dTE+LWyxMtu8YBFvRnMA/SlIAsM7sYHt6AQgLD0PvTZHEgKnJZ14J4uO9v/4/LSiooM1
         7TthHYWHomJMh+z6zsEx8aj1oAgLsSTeiH/1RPMZZuV5fTSvvay1KYW0yZT11Ab14MlZ
         9QFA==
X-Gm-Message-State: AOJu0YxhDl8UXCmT+JAR1xn5ZRoflAr0rDtDV7NsB9bd8OngP//4NjMu
	5pxAvadecUhQU1gfSxv88GtVGXTlIjANIJKZmrnwE4SpG71VHCDhIrAvxVZkWj6LGWz4pFxpmQX
	iEwgVNiWtolBWA8IW7UWlfOLhr5CMiyR0ncsDWJ4TDLFtdwb1HP1N/DrQQCKx10oGGYl3
X-Gm-Gg: AeBDieuGIWPsZMF1SUZ+Ev1rx3hX3LUCoU9gU8ut1HSfPemjtkUQNcCV6o/DErPyKXF
	+e+tQdxdqXECT8Qi5kCt17xv+CQYVxMrJuELWNJyEXT/7xjlROfytN3qphVEutTqNwGcWd+QjC0
	/ZzoUkceoemAdf0RRwv7kjBVIcQtzs21jS9suzUmUjWwGvPlKTkbnF7hp5ielX7kxYHjtkbo3DV
	vJRnV8u4XSI9O6Kf6D/LspEL+b7OTAUeV7HLocQOUW+Uo6YJIm/f+o0qA75+ahd3M3slkRE/kLp
	N1fK3cBqs9qLCPZfDnzMS0lcXKDiK/LBInrV8jcsiHoRn9Avhnnvs/p+BhtC5coYaIr+VgX5g2M
	IbYJJPovSSN7qEF1oKcXQn282xKC1rUda6cEBI+zrfMCAeFxfjJOfS+yoY0t+ASe4/Ct7kqK2Px
	Os+wMPJSgsmJKGZA==
X-Received: by 2002:a05:620a:178f:b0:8ed:d6df:c768 with SMTP id af79cd13be357-8edd6ef1bc9mr422897185a.7.1776768172247;
        Tue, 21 Apr 2026 03:42:52 -0700 (PDT)
X-Received: by 2002:a05:620a:178f:b0:8ed:d6df:c768 with SMTP id af79cd13be357-8edd6ef1bc9mr422895085a.7.1776768171730;
        Tue, 21 Apr 2026 03:42:51 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-672c4d50922sm2464976a12.21.2026.04.21.03.42.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Apr 2026 03:42:50 -0700 (PDT)
Message-ID: <b8bd10c2-bdcd-47e2-8fe0-92177906c477@oss.qualcomm.com>
Date: Tue, 21 Apr 2026 12:42:48 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: sm8650: add CPU cache size
 properties
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260420-topic-sm8650-upstream-cpu-props-v2-0-689e07d8ab8c@linaro.org>
 <20260420-topic-sm8650-upstream-cpu-props-v2-2-689e07d8ab8c@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260420-topic-sm8650-upstream-cpu-props-v2-2-689e07d8ab8c@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Vq8Txe2n c=1 sm=1 tr=0 ts=69e754ac cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=nGxWEAIRjKdob76_-7wA:9 a=QEXdDO2ut3YA:10
 a=zgiPjhLxNE0A:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: TOaD8188TdxkjhtpdawAi3jKU5OpML5Z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDEwNSBTYWx0ZWRfX+D26Iy0eMJaz
 x5MP3xhCmqAg4Zk1XMhGd+M6FKhebK+X+xBW5aWh60AF05Lk/Hcrmu58f38T57LZbltBZkKcTzM
 WF6uFL0pjZ5kZMjH7g1bB19tHRNJyHuofb0V1qX4Bs3JDN1/1IRNxUUSdAazDptcRwBythGna9G
 quUEvfPxSc+KXF2IjDKMUmYF9Qb4i3MzYUgwELzgeaCIDBLZD92gup68HhNONBtOqRWorJZuqW2
 xh3pthFPvo8SuNHjXiDhHXPad6tUNWsDmdnvWJpOfRl1lYJVigyM87OutmIO1gTmdm4X8weImRo
 sn4NEXFlDzMDbBnFwHxYVKaDtintW7XHZQwLGM4ugH4PM26qdSfo4nl4CypJNr2IK2nz21qgnkE
 vh/GWyHAxZttItrgFjAYQAB/yeMQps6w1//hiJHc0/UdqIVkliCpDVC1eVBoaVBZrD3nG328NSe
 XIowssd5cfdCwuNBoVQ==
X-Proofpoint-ORIG-GUID: TOaD8188TdxkjhtpdawAi3jKU5OpML5Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_02,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 spamscore=0 impostorscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604210105
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,linaro.org:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103925-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
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
X-Rspamd-Queue-Id: 5FEE0439A81
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/20/26 9:26 PM, Neil Armstrong wrote:
> Add the L1 cache size and its line size (cache-size and
> cache-line-size) with the corresponding L1-I cache and L1-D cache.
> 
> L1 cache is unified, but clidr_el1 register (get_cache_type) tells that
> L1 cache is separated (CACHE_TYPE_SEPARATE), add i-cache-line-size and
> d-cache-line-size and cache-line-size of L3 cache is specified.
> 
> All cache line sizes were confirmed by checking ccsidr_el1.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

