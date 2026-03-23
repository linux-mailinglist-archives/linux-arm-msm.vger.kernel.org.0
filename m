Return-Path: <linux-arm-msm+bounces-99243-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8LbIF5E3wWm7RQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99243-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 13:52:33 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A08AA2F23DF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 13:52:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BA9FA3060CD3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 12:48:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 088703A8742;
	Mon, 23 Mar 2026 12:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iXPS1eGo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hZ6FGW1G"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5BF43A9618
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 12:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774270123; cv=none; b=V8JXRDbU3AKS4Rrib+UgKUbDxKndwLYTIG1CSUzYS9HtY++X55JUPJDO1b2IvTABiuEYoAFNOC/I4riKRPXp5IkALat/vKufKuN5yKqPy6v/9hG1b2ssB5k+1lB7vby5QqxnwFoGO1rRZBGxmSP9GYvMEKdOu5eg+Pt3eIR27zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774270123; c=relaxed/simple;
	bh=HTzxOQsvTQhUcCsxUraREo05f25pj2NDhVCuGHnuvkI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bzdo1Tz7MGnB0eT+RoAMe3J2nuKAk8kZTQzEhQo8dlbmEnu3f1GFSiPF2k+I+qNzz8PITuaIo9NcYABrySVyfqXtCL2F4gdRZg4ETgH9wIOyCtw3HOzdv5RD/r8xaZVxRLFkf/vI//o6vw09vxn7wBIPNy1kCjQ6czO8EjizLCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iXPS1eGo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hZ6FGW1G; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NBgIoG123193
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 12:48:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SKWVOUQr7ioQ6UdvqDDLYUbJfFa0b5Q7RuTgQz4rvh4=; b=iXPS1eGokewEZR4x
	nN/ISNkXcy5A8hR658g/ebyR6TnMm/IQaN9vGoXZn6DZcjRbnMOUYhe6sDHsDVhW
	kBw/FedVkzd0ktE8q4WcjUuozWKQkPoHZYCN1UZhqJrAd7cR2amGxP5mWaw2cENr
	eJueqolaAbPBa+AaUTl/QhNmAt3dBRreCSEx2w87nDr2k6jSIXKFniC32QUr2YDj
	x1G2+QMgVonIM0enWAR673Wa+hoJczIUpFwuLpwEeCyxVYYJ7FJYTYWaL7SS4grx
	v93gjZB9aemC8cfnDnavQFdWP8mS9m/3Y9YW+dE0l94RHbRreiwygaP1Ix2dtsrU
	q/0nAg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d34vkr6wp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 12:48:41 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-89c49436edeso36692226d6.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 05:48:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774270121; x=1774874921; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SKWVOUQr7ioQ6UdvqDDLYUbJfFa0b5Q7RuTgQz4rvh4=;
        b=hZ6FGW1G/A8QWmmkDJHGQLpM5qCbVjPeV8m6DuCgK/bliGnTF78yfRLJrsBNlEE9x1
         dI2Ao6MKg2byJWnbaDIRfi7DKbRXz/d43ceFyOe/Hlan0vZLWJiSTOe73q9ufnkG4aEG
         3WGkCokREn6m8tAIfAcfyQsi18rOYadmfggttHekNm27CF43XwROzPBon71KJ9ugGqvO
         vby7FWU9xYrDrUUBTU7CI6UbiQqb7Bjrx6KkTuhQAT4btbbYTxZtgA13GRqLem00ioyz
         42ea66aNIHCwmZT6mQ8ebuIkqsWTNgc8iLFhqMDHSAgBYvohghbXsYMv6P6kKiSCKHQY
         nU7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774270121; x=1774874921;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SKWVOUQr7ioQ6UdvqDDLYUbJfFa0b5Q7RuTgQz4rvh4=;
        b=KBnzsBS0tAhB8kjg+qRxp4uou2kcDNf0xI/y1xhs8foh2jE/SFRQmXoft4J/jIKZdk
         P8Pc9+JZ/QlEiVu0V+aeUD4KFe0Ox7mv5EaChJUsNrVOknoB396G3TNzp+6ODrCkF6U+
         x2Wlcb2oyTu86nBzLAmQw6DTLWhHahRx80siC7Fqpo2Apn7vtBeRGkLyFLM4ij+gvhMv
         657d3KGEEumP/D1OTGQyrVFKeOd2BO22co5jzW73t53rf33uQLR4G8F0OrTO/YYcju6S
         oxwg+KvKfBSsPaKtc2629yz7xkpFqtXCC5xVypMUjt4mhk+1YPdryqiCsShp/TQq7IgQ
         Owzw==
X-Forwarded-Encrypted: i=1; AJvYcCW6/PzYRqCqnEEvktzci5PuDK7gJNvxyyyEmRxyiNA3oFzYdk06SAH+HSmAWbOWugDOZRZNaH4Izns6bGSD@vger.kernel.org
X-Gm-Message-State: AOJu0Yx24guJzHo5Q3XPZ+e2KXK+NCtEGsG02svHITfxApbmoSgYsFoN
	HaasYUGivufzuFC4sWyv9hrcw59OjlqEgSxHNu3H+3NX7IbVHdmoJZmzTmHdJ7/tI61ihDVy9Ss
	YI7t0LHF3SqqX4XfH4blauzX1nMOxmsW0VOjnAPFAVA8D7KxLPI0DvdfOgVdlEHgrtAPy
X-Gm-Gg: ATEYQzyiWBfAfcPnp5TNUSDzIS4KYWCJ+N/te+qpVhQteod5XRtOxieQBYu94oWRuUn
	ZJWiFGWzWSsOzhrmz2iWWd0AW5Pdm2AzGcqHg8TMJ2WMYuSb2gxy7lNaeqE9Ig1Z0R1JLYm8YHF
	5u79vakN6G5r+ZZ039xMBSL5CmYmtU8R3+4geHdn35i9eoePrj0zkUNFquYfCktqF4auxcMxZ9d
	86JFx4Yisa48oZ4sC51FtAzpMOtTLDX5rfbB57l9ZMRB+Ba8tCXu7wmQe4som9zJJmdBGFIYYv6
	MIEg/X2Rl5hwfgdAY6041NhRTw7cl3a9xgFJH++hWl0ta9t2Bo3zp6lzlm4vyCJutEc4zfVG87P
	A70lN+D5b1SsYqSSf9l/KsSPX07/M3R54E8sTxk2Ps6b0rrcA5g0PyQpIlKa8IYjZV0t2WKA7eZ
	AQAo0=
X-Received: by 2002:a05:622a:248:b0:509:15aa:cf03 with SMTP id d75a77b69052e-50b374f73cdmr145336711cf.4.1774270120761;
        Mon, 23 Mar 2026 05:48:40 -0700 (PDT)
X-Received: by 2002:a05:622a:248:b0:509:15aa:cf03 with SMTP id d75a77b69052e-50b374f73cdmr145334321cf.4.1774270120113;
        Mon, 23 Mar 2026 05:48:40 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b984bfdb2f1sm312588866b.19.2026.03.23.05.48.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 05:48:39 -0700 (PDT)
Message-ID: <22a469ef-0a25-48f6-bdc7-95ae5541e834@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 13:48:37 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: dispcc-sc8280xp: remove CLK_SET_RATE_PARENT
 from byte_div_clk_src dividers
To: Brian Masney <bmasney@redhat.com>, Pengyu Luo <mitltlatltl@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        White Lewis <liu224806@gmail.com>
References: <20260303115550.9279-1-mitltlatltl@gmail.com>
 <d2cdaa7e-1a17-4e6b-879d-266844958410@oss.qualcomm.com>
 <aahGtIkxtNPeeWKc@redhat.com>
 <CAH2e8h5oHvaADPgE_GdPQsWrU00XUT1d0ktbE25ztMeBEE51Yw@mail.gmail.com>
 <CABx5tqJ_spoZrhX7n91rTOaMcp1G_n8jB5aJV-rNbSPYZBZxEA@mail.gmail.com>
 <abRBT4niX2CB9XVR@redhat.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <abRBT4niX2CB9XVR@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA5OSBTYWx0ZWRfX0ZFsopI5u/HS
 1nNR1jb/q8+rO3kBUBKkT/h5jrR4wmG7eA9hta94yt4tKLyoL4rFO/cSAmtx0TJa+wGTq1MHFB5
 tFbW034gmS4yKYtZvAmFpRZFjXDg8THTElYTuUDjYsO9Y/x6Hv6v2Fv8/0al/Qf1HzKZ53cLedC
 1d52YjcHCq3AZ1ogQ/vMdTSBB6/J3/E5mGNd1eF3y6t3eeSh+0fKgfNCYRHfKDiwcAq92YplUaJ
 foxla7KiuwU/xLh8Xubwtxj13zxLBWPD+PILRMdGYFANEelpamusxlC3o91afU5xMFC+qsljiuU
 vw7dlx5phwDQQfEKMPqWDFrIAb+UIjrAWvOQ3GLfNInOPq8Bsv7V53Dfc0c0q0EdSD8XQqr4YjL
 8SJ0JVj5OvHPxx+MPXT6KnBJTG0Ot/CHRJSSY2we4Iy+jhoz6RSb/uUXVcgjjjAlQl4H9/aSYZF
 6HqNivE/CXN4Omm+tEg==
X-Authority-Analysis: v=2.4 cv=eMoeTXp1 c=1 sm=1 tr=0 ts=69c136a9 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=pGLkceISAAAA:8 a=20KFwNOVAAAA:8 a=fZrft0mfdvsrj_7f_QgA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: wA_rSxOSt8EOZuGm0qb0_hILUSAnpivi
X-Proofpoint-ORIG-GUID: wA_rSxOSt8EOZuGm0qb0_hILUSAnpivi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 bulkscore=0 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230099
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[baylibre.com,kernel.org,vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-99243-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[redhat.com,gmail.com,kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A08AA2F23DF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/13/26 5:54 PM, Brian Masney wrote:
> Hi Qualcomm Folks,
> 
> On Fri, Mar 06, 2026 at 06:27:20PM -0500, Brian Masney wrote:
>> On Wed, Mar 4, 2026 at 10:08 AM Pengyu Luo <mitltlatltl@gmail.com> wrote:
>>> On Wed, Mar 4, 2026 at 10:50 PM Brian Masney <bmasney@redhat.com> wrote:
>>>> On Tue, Mar 03, 2026 at 01:10:43PM +0100, Konrad Dybcio wrote:
>>>>> On 3/3/26 12:55 PM, Pengyu Luo wrote:

[...]

> Ignore my previous patch set. In my v6 that I just posted, I updated
> clk-divider.c to support the new v2 clk negotiation logic. The
> clk_regmap_div_ops uses this driver, so you shouldn't have to make any
> code changes.
> 
> Anyways, would someone from Qualcomm be willing to test this? The
> procedure is fairly simple:

Unfortunately, I don't think it's easy to get your hands on a 8280
device with DSI.. maybe Pengyu could test that on his tablet/laptop.

Konrad

