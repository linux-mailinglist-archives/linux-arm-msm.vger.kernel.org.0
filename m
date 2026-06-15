Return-Path: <linux-arm-msm+bounces-113077-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id A4qEDA2PL2oICgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113077-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 07:35:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E781683801
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 07:35:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=eq2KrgWa;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=CeI5FSfc;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113077-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113077-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4B95C30028E8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 05:35:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1267D3A9015;
	Mon, 15 Jun 2026 05:35:02 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D0843A7F64
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 05:34:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781501701; cv=none; b=YPGHVuHF5F6y/kKzXfWgniNceBSHUmrGzl3b/hl8+l1Mh+Oq7HvkjYTqK2iI9A9bsIMPG4tM6KQZlJs3UUeU7kuYCkfU6DzYPYFxcbiYNWtxpSRwxdhC3tbvvCWKzKif1C+xNesc9iovBIMbiYaX5W5tXC5Aqu7HNtPtNJwBhKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781501701; c=relaxed/simple;
	bh=RxblkpIC033IGRqSz8PzKM3bfvj7YHZDH/KxCenMQsQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dBsLzhFSMJeaO+mdYA1ZTs3kxi6tVIqwAA6YO7v02W8VXcFOOfYhr70jc+Qx6ZdOWB86nafwTqUN+6iWnXX9ApvAAx9lqU2gXIsyGUefOF/nqfG3VTkrY8OCeCXXW37Pu+B0U0rSonpBk099QuZB6lzqSJEKtNjg34te1A8PpyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eq2KrgWa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CeI5FSfc; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65F1jP5S3089769
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 05:34:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x05aYQlMjFXE+lV3LQNFzHhZRxyxeXI9gIkbFls0RTg=; b=eq2KrgWa2jv9+uVX
	2E3loq3TYiLyTL87k0di+sAVFMxakWN1rvT8IEQLc55A2pBxMezivKRruvaUOOZG
	j+39h9jUPvA8MYB04i9LF+S03P+s7Id7l2pLQuteSc4QaWodh8QlwTthP2HtnAJ0
	fu5BWf44w5sT7Sib7u7dsW4RCAcHCI66kBGvkQUM+ODuCNddx9ius2CEC8AdcE6S
	789QJho9XQ1e4E3r5LKipM35JVCdgRuRyVBSJWNHlm+EHONcpFT3JNZWZPY3bxvj
	MKWVOc1XpJML5uiy6r/k3xnb3nkERKgZkAc0oeJnbvsbhCKWml2h6beiT9WWgGam
	5a0KCg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eryk6dkyq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 05:34:57 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-36e09ec696aso4985902a91.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 14 Jun 2026 22:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781501697; x=1782106497; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x05aYQlMjFXE+lV3LQNFzHhZRxyxeXI9gIkbFls0RTg=;
        b=CeI5FSfcSqJqEYcxeszp0/h0TgqjWDF6WA0q4uSXyOaxxgmzDalTsP7pS+KjRYMaHV
         5wHsE8iQL5nnxkhUSyowFgJm1Ek+skFSrbBmhkehPXLJrcPkrvK9gs5URAXI/h3JUNgX
         7RV3Ddmyq4KZ3Roakt2YuYv/wObEgy4zUJP6r21hYs4l76V0pKHbEmb8LK09Zm1Y2yQH
         v3ZVTH6OyKcrhlqIF+LylwyA2I5Lr2OW+3/3AGXaJtaZKoJCopnP1EUNMs8D2x7aH5eE
         Hi6qM13wvTe8NiJXkGrqeOuwMhdtefpiU0/Q3jB+BFV8Pl5LyT63qjFtc27DH1SNTgrH
         oujA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781501697; x=1782106497;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x05aYQlMjFXE+lV3LQNFzHhZRxyxeXI9gIkbFls0RTg=;
        b=SZ07m7Ze0RGNfLgNdUCZy8LPsa51ffFPcvtqFhhBEPGh55E4DK1XVITBEIy77lViPz
         FQqFpCl1hwqk+osf01TlC+pCKquqOdqOPjmaeMgMiegUDouOfdTDCax9tfS/nfb8el6e
         jabDRtsfa7SHsS7jA5skk0wtUS886ph7iL+Cz99JTm1Lmio19qiGS7VCYA6APK8zSPq7
         0E9CZukicZi1FA692allpdmdpoewq/bZ5wH3O6S92I1t5FI76jamAUjuqPPp8XAfLrvF
         aYugniid4MNZQWuh0QOw0SUh9rMOloFLWbQnRv3DeXx8/mjzd9PJeBYUsFQoAikvB8Bg
         HJEw==
X-Forwarded-Encrypted: i=1; AFNElJ/LcmIk5wUCzIviFA8TI56RcsFKRF2hspVIU4cwidbe2Xzvhndgsawk+UTk9qqGUrIFs3Fq1Q4Ev85wsvL7@vger.kernel.org
X-Gm-Message-State: AOJu0YwB/nVIlfBJT9YtcHgbMgJgMvbtQXhJvSolQmS6MwZ+8A8m4Ihv
	n9maUguV7QchckR+5oYv/6S1WisaRI5gXshSCPwxevN3hxQGL2nNgL4xavA79IRGtQrV3HR6cxj
	3K937DesFeLzBynR7lV1iAHXwJF2cmTl8G7Jd6AZMXMBpPXmcSzrcCzvU4rpBpPpZQFZT
X-Gm-Gg: Acq92OF/e0LwearBgut/QNTsZRJdETqBLWX4+PgZMskiHBtLaRiFRyDa4fQKTlrvkaV
	IIVmPyqQbD1z21uuhm1j5Kml8xyqmQuVawclkiCCECA1wSD5GmByVnRhz/lp49iJZotzmCDA5hv
	MYkPog4J1wiKgv8c2y3stCcde1AfJhSs4OPTMiOYfSbF+/hiNf7cviqO8GQR0clxZSpeRgHuMcQ
	OV0LxOVtS+R7/4qaqaLsCIyw3PUo+SBe/51HvgnGIUTQPMG1c0wvGvVCU1iZwDDv8uffvgfD6SW
	D0sJivEmZDrOKq6MX0VJbwu74mtdAfIPkxNu1V/ErPYGVp11V1x6R0O/5gXKI3sAZDAapODOjM8
	+qPcUGQHvbJDCvcMZLLHG6yxPd3IQEk96CzrrCh6IWTxBH6ba2Mg=
X-Received: by 2002:a17:90b:5102:b0:36d:df4f:ab2 with SMTP id 98e67ed59e1d1-37a036ea6c5mr13740046a91.13.1781501696729;
        Sun, 14 Jun 2026 22:34:56 -0700 (PDT)
X-Received: by 2002:a17:90b:5102:b0:36d:df4f:ab2 with SMTP id 98e67ed59e1d1-37a036ea6c5mr13740026a91.13.1781501696316;
        Sun, 14 Jun 2026 22:34:56 -0700 (PDT)
Received: from [10.217.198.242] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37a233f58ccsm9379806a91.3.2026.06.14.22.34.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 Jun 2026 22:34:55 -0700 (PDT)
Message-ID: <fe0c4483-3bf2-4c49-9652-87afc91f55ea@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 11:04:51 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/8] x1e80100: Enable PDC wake GPIOs and deepest idle
 state
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Linus Walleij <linusw@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org, Sneh Mankad <sneh.mankad@oss.qualcomm.com>
References: <20260526-hamoa_pdc-v2-0-f6857af1ce91@oss.qualcomm.com>
 <ahWLPy8vg_neYgrX@linaro.org>
Content-Language: en-US
From: "Maulik Shah (mkshah)" <maulik.shah@oss.qualcomm.com>
In-Reply-To: <ahWLPy8vg_neYgrX@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDA1NiBTYWx0ZWRfX+KwJ4v51CLvM
 MoO+uTL2y4pgMUvGZ8jS17XSROKZoEDHlGULY/00hVhsjI9N5GcQ3DuKD+amVbHeRfuKhlUSCCT
 AirDeasCuyZPKWXm/dvk0jK1Y5fpRuw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDA1NiBTYWx0ZWRfX8b4AMzc9r0Pr
 +eaGwqDmtv9OgxO3jAMfZ/wfnaYWMj8TbupPrHtjal4wnMUT3BoDl1KyqctbVa84kL2tVj3CU96
 554VwZrbzGAPaFNS+CYdspaqPbVTBveKCcrQYNGIKk6eFzh+BYmF0C4wwQEOEWsmBZnRvnV/reG
 iDCCSJ3vkpj1+Fg4S+Xe7FQojGu/spWPujni4e4d3Fsop8N1lgKMBXKBOJ9/Bbu2ocDd0QylMhI
 RRoZyxiRlYP8b9JJWWCg6aB05rHT9Jnfo826BNJcZRKLK7vCzze2WGiG5dGJZ+d3CWs87NqajLN
 9/Jz/htWl7cD5pcDVyXxLF8p6kfMj2am+IfhA2M1W547ohzJmkKO8D45LnTtalrgMukCtE23A+Y
 IDihcJFdNufLUveXk4bw5GBfcG3w2acfwbSw5mQrHwYQ9VeK2V5ZX1Re/e17Hx8GCD7jd2Zc6T0
 Jk24iYa/xoIM2nW0u6Q==
X-Authority-Analysis: v=2.4 cv=NrThtcdJ c=1 sm=1 tr=0 ts=6a2f8f01 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=JbAvS3xc7vGkN5pBbYkA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: M1rtithK8_WakYB8lQAhWGLgLO2Nrvm3
X-Proofpoint-ORIG-GUID: M1rtithK8_WakYB8lQAhWGLgLO2Nrvm3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_01,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 clxscore=1015 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150056
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113077-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[maulik.shah@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:stephan.gerhold@linaro.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:tglx@kernel.org,m:linusw@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:sneh.mankad@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maulik.shah@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2E781683801

On 5/26/2026 5:29 PM, Stephan Gerhold wrote:
> On Tue, May 26, 2026 at 04:24:36PM +0530, Maulik Shah wrote:

[...]

>>
>> The series has been tested on x1e80100 CRD with both old and new firmware
>> and also on kaanapali.
>>
> 
> Tested how?
> 
> I recommend testing with the tlmm-test module Bjorn added, in all
> supported configurations, to make sure you don't introduce regressions
> for one of them. It would be also good to provide the test results here
> in the cover letter.
> 

Sneh tested via tlmm-test and figured some issues with test module [1].
The test module fixes are merged now and I will add results in v3 cover letter.

[1] https://lore.kernel.org/linux-arm-msm/20260529-tlmm_test_changes-v1-0-88bfdccb4369@oss.qualcomm.com/

Thanks,
Maulik

