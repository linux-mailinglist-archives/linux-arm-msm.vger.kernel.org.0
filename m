Return-Path: <linux-arm-msm+bounces-115452-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Aa4WFpvKQ2pfiAoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115452-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 15:54:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D15D36E5175
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 15:54:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=RHX4chGf;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Wn7l0Pdi;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115452-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115452-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7FA0E314E179
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 13:50:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F45127CB02;
	Tue, 30 Jun 2026 13:50:24 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E4F3369D4B
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 13:50:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782827424; cv=none; b=ZJeZUUTvASVpsAfq5u35xzRLhszQogWvXmEx2iJxeWp95KEzl/wiGk997xzPIOSiCORhs/iArOtCZ/7QA1vGdGceYLqGGD2U7nwn2ZNMpYlz4wb76x7RPvYySOfE3Hu65T56cagFKu+5CdWtMbDcO26b8SC8YsHPnMZcA5z7ImI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782827424; c=relaxed/simple;
	bh=YdPI25Y0KafMkusWlR6kufqN3mfL+8si6vN4ZnzjUlw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N8Lev3fsOHhkzoiWyvPf5csaT5l7CqljuNG5taqsWabps7JkAXFjEjwV7BTAMcXFm+M0QqN9Fdkea2JvpCinhyQUQn0Zr3enl0f/WO9CdpZgLpm8k3lpNrCLELuVR3vh56AUUcKNJqj3PNAbQ3t/GML41e3Ur7yD7cAeUlK5LHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RHX4chGf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Wn7l0Pdi; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U9nCA71590607
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 13:50:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EOKJcgnb5KIG7WRtPDHZ60NI1QVvp1pmwCPdue2Coi8=; b=RHX4chGf53jjPNcK
	Rmv1cA3XaQr0OVrY6o0EJMrzp/scNiYbjLRkLX4YTTNeZwPaUvA/VoewQbrctRus
	POVx1dYClq8+V9qoW/+lqsR+xVUa1/RDR4e/v4P3S9djwD759UOrukFBiyQtF8gT
	gOZuHoO/LVDp986HLsW92RCm8avyo55U/Z3m6NehuAsUowfBaOhPwmtSzKUf7bJP
	ut3rkl/HWqsW7S99s8wtYuUUxaiU74jDhaPct7bIVsekGBFE0g32a6rQ1IoGf0ug
	pKOkq/qRxG0ODSSP+Om7R9G3fmtqCDMTutihvtlDTgaO/zmkR+mLu7n0+yyoEzx4
	KWVtwg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3y9k3u8m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 13:50:21 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92b79cc1f21so118486985a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 06:50:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782827421; x=1783432221; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EOKJcgnb5KIG7WRtPDHZ60NI1QVvp1pmwCPdue2Coi8=;
        b=Wn7l0PdiwibgoFl1w4VEyjJH9V94yhyyWUxaDRy0VJdT2k2/9N7KD4AnuTtfcgjUQ6
         xPnXgAI0qA4BXdnznwPjmezzLxzKURyD/6yatqK7GGaicf7nGEU6xYkHk9qJ0kbeVhLy
         wxymQKpbu9w9HY1KBdTwMSSuwq6fxyxPTG3dh6y/e6xNGqNQUbFXQAiNjOe9zqrdvFbj
         51m7vhC8rG93V0LiUfILVEFekn68FFSj0W4Dftxcw+vimDZl53m91n3JKMfc2n14WslJ
         JBZ86E8TQoy82m/yu2nEtkkM9pg271h55sxmyS/4OLCDkE3ih106bJQnfdcQh56Zhb2Q
         yS/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782827421; x=1783432221;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EOKJcgnb5KIG7WRtPDHZ60NI1QVvp1pmwCPdue2Coi8=;
        b=Vx+QB/uJHkC4HgJW2m6ZuWsYQMbeQvq3tIqGjkigVaEMubvBEDycuZS/ukInGse7Ji
         e0moJ/Qa8YhAZSaHobKGOG0eUmsvaQxKq3oyrKCCjtMxWVIcM5mKsSd6Z9ImU/kKTb+l
         19NDIPlyMk1Zgq+s8JLmnVjc2Tg4uL1fmCGTGRZ0IcoJv4cqB2nrqgudD+LSg0D8BqAJ
         Tq5gOgRdq4NFYbIddnCz1lVPA2TYkAU7RjImwsTEKKW/wda/eHlC8PqsGZJzBWq/Zhbu
         vp9NjffEaLIN6mI0juk9wDLbFjrQvtC1fRq11sAsSGUvXgjiPJPfYyPP/tKSJqo4ztYg
         tflQ==
X-Forwarded-Encrypted: i=1; AFNElJ9iW+ApcYEd6fp6hGzZfERcWG9aj/um3lshvbxQbabi5Pc8FT97dx+rm+3LEoqna7dnLkP7MsjeOn5mK2C4@vger.kernel.org
X-Gm-Message-State: AOJu0YzcKcaZ4gN0nTLq5spMuYEQUpkjTvJxSOHyD60y9gPqkrN82gkM
	8ceT8InJ38k1+k9AwqZlsZDT/YwSjt461AFfH4reOgjX2BJrOPEe/E6eQjvJCVq0CWikOdbhHte
	ENZymZVmAzmpYRko4o+wCLnLG/ujHHyoQGUbW1nrjkFP6HQ1aFaEqKsBqjaGdw9wOZcJf
X-Gm-Gg: AfdE7cnLJX/2GU8g0hWtC7aIO8mi23xABNIeO2ygtXwtQ8TBjlxrvsAPGf+vOjlRR9Z
	UTuFA0bumiTdW5BBmWe+piuBKfz2N0yZi2mUBFEGngzD88BOMQWxcSBab6t671WCnTFPQ5SR3Eo
	GHmEyWa6VVrSLfNjAAKElQdpkRBrzK9CA4mXxDe4vHxtS7QLgqeXIRrYxMcrPP8HxD/y8SRPbsP
	a7VuyVA0Vtj9TiwSRHHCiX2NTNR8egLwoce2IeOogoaGHZ9IAyIWo7ZKBt8I/a+ZIcp/akJzMhg
	tRE5ZJ8dNYDwSLHXMub941rJeDxuSqmtBjUX6SOevyYU+2MjLUFhPmlAw8dEzsvTMN0aaofzc92
	QKMBoBGeSD7EVso0pjA+Lw2QBpOCampK6O4I=
X-Received: by 2002:a05:620a:318f:b0:92a:228:1bfc with SMTP id af79cd13be357-92e6261ff87mr418512285a.2.1782827420559;
        Tue, 30 Jun 2026 06:50:20 -0700 (PDT)
X-Received: by 2002:a05:620a:318f:b0:92a:228:1bfc with SMTP id af79cd13be357-92e6261ff87mr418504685a.2.1782827419677;
        Tue, 30 Jun 2026 06:50:19 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1288f0d68asm131816766b.31.2026.06.30.06.50.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 06:50:18 -0700 (PDT)
Message-ID: <33c74e59-076a-4877-9e62-83a8ebbf2d54@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 15:50:16 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: Add Shikra CQM SoM platform
To: Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        sashiko-reviews@lists.linux.dev,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>, robh@kernel.org,
        linux-phy@lists.infradead.org, neil.armstrong@linaro.org,
        vkoul@kernel.org, olteanv@gmail.com, krzk+dt@kernel.org,
        conor+dt@kernel.org, devicetree@vger.kernel.org,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
References: <20260513042836.073F9C2BCB7@smtp.kernel.org>
 <t2sw6owdxy5iyodjqsldbw6bfaqnezhgvc4hhylxuyrrbjkjto@iwf4dr5nmot3>
 <20260513142936.kauwa3czigfs7qs5@hu-kotarake-hyd.qualcomm.com>
 <0ac665bb-1a21-4077-aa9e-97162f7f4784@oss.qualcomm.com>
 <20260514103918.cs5m5kcxcrcgukvx@hu-kamalw-hyd.qualcomm.com>
 <obdxony34ckfbtsqj66siszw44sgieskcye5hg66ulkisctpwl@fyqczpze5tnw>
 <20260518114927.edxbzvklqatlntv2@hu-kamalw-hyd.qualcomm.com>
 <CAO9ioeVMieo8HtpRw+n4ZU9uV-_RQM061q5XfAA1Dtk2fnp4+g@mail.gmail.com>
 <bvankzuazswuigrm7hvyjqigzfaru5o43wi3zvyphgme2pgqwz@pyspqky3u6cn>
 <5idu4ljmcvcvzqsr5g73h2roxzs36l6xxc5ju6ovc5aitt3gx4@wmfqueyf2rj6>
 <20260630124220.4lja4zshpf66kwj3@hu-kotarake-hyd.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260630124220.4lja4zshpf66kwj3@hu-kotarake-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDEyOSBTYWx0ZWRfX31aPZTAxSAnG
 DlaPKfcaA/ET4iTncQ79Ci1Az+Uc1+INdW4V5tJWJvnrKP0u978mOtEAzvanMhHCyOch8xQsJMm
 FOeKAG84K1i6lYOoN9cBSky1ZXhymTY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDEyOSBTYWx0ZWRfXy8Wr4XC4cRY+
 Nm5rE338/VmYI60DPIPUiLeHu0NbyuGBTkEYRvLfDQEHO/HOeyT+3Ry/uHUWXj0yVozXbEXaGQb
 LINiyNvAysV8yV2rfzJDKoqAM1/YFwg9mr9gqvwtbiSw9Du3hjmmL/gBzS0xwpsC8b66MIf+sYR
 a7rwx0H0pWm0p0j6y5XIAMbE7f/DomopbK7CKngwKUZS9wwxyvrov8DBvUjagYyI0Ndq25ePo+w
 Y3GXCfJlamtt85lpJx3vn9Mb7E2cCOKSLsvVELqtaKR5etrbqnSVVpNQf/gILQk8WMyn2Znp8f9
 no4gY1z/bu1PR7k+/nGQ/hUSqlVPsrd5jth55oefLOrkRP92yIogg2l2EG7RMy+ONYRTTAyElgZ
 2qJTGxhAjysM/Y1w3hpWa6KguB20K95SZHBS3432M0vWZOtcedsR2PCHEJIk05pKfOU9lKGe6UG
 9ePur58pndpWwnfrUvg==
X-Proofpoint-ORIG-GUID: skYIVzQR7zMWe7YotLUHmQcBRnoLc_tO
X-Authority-Analysis: v=2.4 cv=TeqmcxQh c=1 sm=1 tr=0 ts=6a43c99d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=rAtRr1t42OMwFRgtCCUA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: skYIVzQR7zMWe7YotLUHmQcBRnoLc_tO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 spamscore=0 adultscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300129
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-115452-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:rakesh.kota@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:kamal.wadhwa@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:sashiko-reviews@lists.linux.dev,m:komal.bajaj@oss.qualcomm.com,m:robh@kernel.org,m:linux-phy@lists.infradead.org,m:neil.armstrong@linaro.org,m:vkoul@kernel.org,m:olteanv@gmail.com,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:devicetree@vger.kernel.org,m:jishnu.prakash@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,vger.kernel.org,lists.linux.dev,kernel.org,lists.infradead.org,linaro.org,gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D15D36E5175

On 6/30/26 2:42 PM, Rakesh Kota wrote:
> On Sun, Jun 28, 2026 at 03:33:23PM +0300, Dmitry Baryshkov wrote:
>> On Thu, Jun 25, 2026 at 09:11:19PM +0530, Kamal Wadhwa wrote:
>>> On Wed, Jun 17, 2026 at 03:48:14PM +0300, Dmitry Baryshkov wrote:
>>>> On Mon, 18 May 2026 at 14:49, Kamal Wadhwa
>>>> <kamal.wadhwa@oss.qualcomm.com> wrote:
>>>>>
>>>>> On Sun, May 17, 2026 at 08:18:15PM +0300, Dmitry Baryshkov wrote:
>>>>>> On Thu, May 14, 2026 at 04:09:18PM +0530, Kamal Wadhwa wrote:
>>>>>>> On Wed, May 13, 2026 at 06:14:20PM +0300, Dmitry Baryshkov wrote:
>>>>>>>> On 13/05/2026 17:29, Rakesh Kota wrote:
>>>>>>>>> On Wed, May 13, 2026 at 03:01:47PM +0300, Dmitry Baryshkov wrote:
>>>>>>>>>> On Wed, May 13, 2026 at 04:28:35AM +0000, sashiko-bot@kernel.org wrote:
>>>>>>>>>>> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
>>>>>>>>>>> - [High] The PMIC regulator definitions omit their required input supply dependencies (e.g., `vdd_s2-supply`, `vdd_l3-supply`), breaking the power hierarchy.
>>>>>>>>>>> - [Medium] The device tree inaccurately hardcodes the `compatible` string to a different PMIC model (`qcom,rpm-pm2250-regulators`) instead of explicitly identifying the actual hardware (PM4125).
>>>>>>>>>>> --
>>>>>>>>>>>> +
>>>>>>>>>>>> +         pm4125_s2: s2 {
>>>>>>>>>>>> +                 regulator-min-microvolt = <1000000>;
>>>>>>>>>>>> +                 regulator-max-microvolt = <1200000>;
>>>>>>>>>>>> +         };
>>>>>>>>>>>
>>>>>>>>>>> Do these regulators need to explicitly define their input supply dependencies
>>>>>>>>>>> such as vdd_s2-supply?
>>>>>>>>>>>
>>>>>>>>>>> Without these properties, the regulator framework might be unaware that the
>>>>>>>>>>> PMIC regulators draw power from upstream supplies.
>>>>>>>>>>>
>>>>>>>>>>> If the kernel dynamically manages the upstream supply and its reference count
>>>>>>>>>>> drops to zero, could it be disabled, causing an unexpected power loss for
>>>>>>>>>>> downstream components?
>>>>>>>>>>
>>>>>>>>>> And this is a correct comment. Please provide missing supplies.
>>>>>>>>>>
>>>>>>>>> As per the Qualcomm system design, the parent-child supply relationship
>>>>>>>>> is managed by the RPM firmware, not the Linux regulator framework. The
>>>>>>>>> RPM ensures the parent supply is never disabled until all subsystem
>>>>>>>>> votes are cleared.
>>>>>>>>
>>>>>>>> How is this different from other, previous platforms?
>>>>>>>
>>>>>>> This is not different. In the previous platforms too this is taken care from the
>>>>>>> RPM/RPMH firmware side, the only case where we may need explicit vote to parent
>>>>>>> is for non-rpmh/rpm regulator rails (like i2c based regulator pm8008), which
>>>>>>> may have a RPM/RPMH regulator as a parent.
>>>>>>>
>>>>>>> Even on those previous targets the parent rail of all RPM/RPMH regulators are
>>>>>>> internally voted by RPM/RPMH FW at proper voltage with required headroom
>>>>>>> calculated based on the active child rails. This was done for all the
>>>>>>> subsystems (including APPS) regulators.
>>>>>>>
>>>>>>> So no explicit handling from the APPS is required for parent supply.
>>>>>>
>>>>>> You are explaining the driver behaviour. But the question is about the
>>>>>> hardware description. If there is no difference, please add necessary
>>>>>> supplies back.
>>>>>
>>>>> I understand your concern about descibing the parent-child relation in the
>>>>> devicetree, and given that we have been almost always followed this for all
>>>>> the previous targets, it will expected of us to add them.
>>>>
>>>> Yes.
>>>>
>>>>>
>>>>> However, we want to avoid the unnecessary access to the parent from APPS.
>>>>
>>>> Why? What is the reason? Do we want to do the same for all the
>>>> platforms? Only for Shikra? Something else?
>>>>
>>>>> At the moment, I do not see a way to avoid that, if we add the parent
>>>>> regulators.
>>>>
>>>> That depend on the answer to the previous question. In the end, we can
>>>> make the driver ignore the parents by removing them from the regulator
>>>> desc.
>>>
>>> Ok, this seems like a good suggestion, so you mean its ok if we define the
>>> regulator desc's supply column with NULL? And only keep that in the DT?
>>>
>>> you mean like this?
>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/regulator/qcom-rpmh-regulator.c?h=v7.1#n1453
>>>
>>> (please let me know if i got that right. thanks)
>>
>> Yes. Don't forget to explain in the commit message, why you are doing
>> so.
> 
> Currently, Agatti uses the same PMIC, so we cannot set the driver
> supply name reference to NULL. Since it's an older target,
> we'll need to run a regression before making any driver-level changes.
> 
> Additionally, the child-to-parent regulator ganging differs between
> Shikra and Agatti:
> 
>  - On Agatti, l3 regulator is ganged with vdd_l13_l14_l15_l16
>  - On Shikra, l3 is ganged with vdd_l2_l3

Is it configurable on the PMIC level? I was under the impression the
supply maps are fixed in hardware.  Is there a chance the agatti
description is just wrong?

Konrad

