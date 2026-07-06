Return-Path: <linux-arm-msm+bounces-116835-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vyK0DPG+S2pSZgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116835-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 16:42:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C8F347121C7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 16:42:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=QbOWvfYY;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=GncpzDd6;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116835-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116835-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 79D90370DBA1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 13:07:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 064173AFAE0;
	Mon,  6 Jul 2026 13:07:06 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC18236E478
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 13:07:04 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783343225; cv=none; b=tJAKYdTmQGryk4+MNLsmHVdsnXgygWcN2OtvbT73PMLvJ2c6kR42koonHt+hFDQvnAWeidBhK0vNP++KVtxU9qWvMI2rarGiEwTF75OJv+JmTa6qMGSs/dt7yWCnP+v2uJIkc+EEzp4Cd+xd6bjv5/JELd4pHt4GEwY4XlxENwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783343225; c=relaxed/simple;
	bh=2/8uf/+qERy4MZwmlx1x9scy7YvKot5nqNIMyIzt8ic=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hL39xESpjLK/yTNe6Ub6AMgdNsktn5XoyFs0Cy8TI9ZwvFgWSE2Fx6d8Q72z2eIh0yCfDL5D1oDnAS9YZru0mDNXR8YtNVyHY4lE5gMhv06lwO28uCql/qm/HHwI38s/bIk35OfoVrPxUbfXlm/gi4PnZ+OqjtUEWat8zgn8Ua8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QbOWvfYY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GncpzDd6; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxFvR391218
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 13:07:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+aJEqe/aUkEC3wO10Vna7LP2Zs+q/5u3K1GL2ugMtcM=; b=QbOWvfYYxMOrrPp8
	bcZMRh5+gVIjxIia+4jGtN2gxG6/HBu+g2SD5G4FQiPmmCaZXxIuaxA17qiHd9FY
	JRMWrQCauBJjo0JgYhxypmj3yRmPWA3hDSD9tWsz7XIR77upkB0J+SsOrzvCRmhJ
	SlhobXzeowDnyvqIfgf3DuDSC53V6bKAf64nWQ23M4oSk6D2Sjdxakos63QbA+bL
	2J5WHHhpOPLcZl3/ruCBunw/xfgrnU+PPFzcdVn/iZHkW4+P/wKT8Vs1Me9IJjl6
	XFMYCfVPI2bjhGBGcfAnSVRSd5uhcnTaLDixCEPfrrm0/fYPG0BruYyAhcDWPjj2
	XVvYLQ==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f89kgrus8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 13:07:03 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5bdcef5085eso113804e0c.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 06:07:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783343223; x=1783948023; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+aJEqe/aUkEC3wO10Vna7LP2Zs+q/5u3K1GL2ugMtcM=;
        b=GncpzDd6GSXhcVDv4llMP3Rxv5Jt29eh170+StYPbN4SasTkgKoJs2ebJSwJVGJfCf
         T+8v6HMzBQd7iUvKel3zYG7Vd+rWNhoKrlxvY2ezHK1zMQ3/TXdyM8bNtCm3Op0htkMX
         Edfw5GLu19qVrnz3y7fizAf/foAYNSOvp/S83XQcWnRW4D3OZPNyVzpFDoslc7VT0YNJ
         P7czAn+o+fsWu2TrWJkkDOOfWKwbYiQgYh1eQkWd61xMAcxn3Xjq4vVVFAzJTnMi0tbY
         COuiQS+fintULPR+CLwImlFoYbzLWv/JI8q9W7QeBcbqtshXYmn+TNa2s9BW2tvH6Zhg
         FyLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783343223; x=1783948023;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+aJEqe/aUkEC3wO10Vna7LP2Zs+q/5u3K1GL2ugMtcM=;
        b=l8ya075thRlP/5fHKClmqYN5uJATAtG66+3Wvga2hflWu/7x1kvR/SOyNWz+VbzZni
         PtAf3YzOx+9am37w0f1J2uWyBOTSWWozveqgdqs8sPdSqMUYVInVIGj/xlBO+NOhWsQs
         ZUoLY8Vf7XEhgGDN+N0+SnnFR06g1yIUz4vUMc2Ot3u9VpF6gyCFbv870qGvAqVLu1CH
         LeRgye5xzZhXxmZdhXC6/YTeAp1FHCJ5q1yRU1GWtk9rB8hW7QsyCLwEY++6tvTPf5AQ
         FxLI8vRxOk0aC0jWj1nKzesJJzyojRU9E1G+dZd9WOAfzRWWHgpN7fRjA1+/wy8M0l7J
         uFRQ==
X-Forwarded-Encrypted: i=1; AHgh+RrfXujlfcA1S0H4qxX8gnrgfMcFR40VOi93+s9Up+xtc06FWMXeMMInrC0/Fdy4EIbi7CFm0LC2e+VJ2IMX@vger.kernel.org
X-Gm-Message-State: AOJu0YxBJpSp/N84fvYJk2nv+tYEX4sWOR6w7QKoVUDKubYyq8TZJSO8
	lWVsFaKOgfdx7g0hQh0Vd50EBT0Sxzrgon828GVxGi+ExjB/Q+09QhDv1iV3j2iYFt4Rx2zvHfV
	7rrLJRfn/UEeiLCZfEilPfJcAh29sTrRgqAqWAqzL4M5ERTZxMnm9nJtMpDIphuUDN3Bi
X-Gm-Gg: AfdE7cn6xtroiKorTdeujG5+Zz0JuVAyZvpRkov9IK+f5NVXvk6obTFN9AdtMx5/xd4
	/9WBqLvihJfcyaEUuIjXQH+KxDSilIivw1X3WQej+FIzWa+2EjMIHYioDkCc1kt+/FOe6pEm41d
	QwVQQjxe5nkZHKkE4R1tkwBX5FBHhFDC7fUE/WRa9xySiGxP70MoDcfHglo3eJ2y4VwbI9NMSnT
	zbnuDLE0/6NuoWYM4FkUmwlyhk6hcUjIhRyNsDd3QdmRvM8uT9mrgxkkisC+tQAV1svRuYldTlW
	tbia9zmka2VWIEsM8+Qos4pHlJmZWJgou4zNpcs+3en+H/QKVy0WNwroUCKrmAKWizXMvhWZcD+
	3thY0A5u6w2iRUPMvqlzDdF246eo1cr82EuY=
X-Received: by 2002:a05:6102:1625:b0:740:178:770f with SMTP id ada2fe7eead31-742079e8eb2mr1233257137.7.1783343222830;
        Mon, 06 Jul 2026 06:07:02 -0700 (PDT)
X-Received: by 2002:a05:6102:1625:b0:740:178:770f with SMTP id ada2fe7eead31-742079e8eb2mr1233219137.7.1783343222369;
        Mon, 06 Jul 2026 06:07:02 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69a19db05ecsm3945114a12.28.2026.07.06.06.06.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 06:07:01 -0700 (PDT)
Message-ID: <a1542303-8a71-4387-8651-fc4f127fdfb1@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 15:06:58 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 7/7] arm64: dts: qcom: eliza: Add support for MM clock
 controllers
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260609-b4-eliza_mm_cc_v6-v6-0-17df09e5940c@oss.qualcomm.com>
 <20260609-b4-eliza_mm_cc_v6-v6-7-17df09e5940c@oss.qualcomm.com>
 <197684ce-e0c0-41ee-ae1b-c9b31a7f6411@oss.qualcomm.com>
 <7eaa8b9a-ba8b-4d07-92c4-3a965ad58708@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <7eaa8b9a-ba8b-4d07-92c4-3a965ad58708@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ECj3WoZZXPlJNCCZJetuZ5kX6VxJ-LUm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEzMyBTYWx0ZWRfX0kuQ5GVkPMIM
 R0Enh/DtmsGPf7TLlmicZW7cPRe+6baTPRdFd9ky6Xb26yZx8m13GfmTGiyRhdM7liT/eL2HEnW
 CsFOxKFpxWbu9eFE/cFhQOuudK4qA9rqzMyg5Kl3R3ndsZCd/3suoWWH4o0PDjrAgll8mzSVgok
 M3/NwDgGfxnzgrc3iWngaEuidDcR7hgb1zSRIhRGIQNkT6+tWkRXYjGCXWHbGJhdu46fCZafOLm
 OZbd26y68r+Agih7bHe9cByscsXWv+9MPqQw+yK/zon+aqom/sjIqpQ1WQP9PAdIhOlgBMMS1VH
 wjSxoLJ7WsBPWPBqQSKsNoQgW76T0RDAuUxnTL4/n8q+7WdUW0FuN1bmxi8Sjvjmf3+/wpO1iyc
 dywyKcPq+u0oNjQvRqcHVdA3OZwptckK4HhkkHWmrdAVwFFToKYlJ0lp2XQBFnLVs0STng1maz1
 ZTSgjhUCiTUesDoydcQ==
X-Proofpoint-ORIG-GUID: ECj3WoZZXPlJNCCZJetuZ5kX6VxJ-LUm
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEzMyBTYWx0ZWRfXya/bz1vXWYP3
 tqDBh7iQMvb7F8VYDTT3KdmEBqgB4kC+HImz2Wov2oy9Z6i2IulAxMM6UTPq2cdftewtAwyAzyH
 LjCwYUoAV57P8OmwAnpaXnZhR5N4kyw=
X-Authority-Analysis: v=2.4 cv=c6Sbhx9l c=1 sm=1 tr=0 ts=6a4ba877 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=uHYfjYNGAha-st8cwW0A:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060133
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-116835-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,baylibre.com,redhat.com,fairphone.com,gmail.com,foss.st.com];
	FORGED_RECIPIENTS(0.00)[m:taniya.das@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:luca.weiss@fairphone.com,m:konradybcio@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:ajit.pandey@oss.qualcomm.com,m:imran.shaik@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:dmitry.baryshkov@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
X-Rspamd-Queue-Id: C8F347121C7

On 7/6/26 7:28 AM, Taniya Das wrote:
> 
> 
> On 6/30/2026 7:39 PM, Konrad Dybcio wrote:
>> On 6/9/26 5:02 PM, Taniya Das wrote:
>>> Add the device nodes for the multimedia clock controllers (cambistmclkcc,
>>> camcc, videocc, gpucc) for Qualcomm Eliza SoC.
>>>
>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>>> ---
>>
>> Almost all of these nodes lack power-domains, meaning the
>> aggregated performance state requests will not be translated
>> into RPMH requests
>>
> 
> Konrad, all the clock controllers are on CX, similar to Milos and does
> not have any special voltage requirement for the clock controller.
> It is okay to not map the power domains here.

I don't like repeating this every two weeks, but each consumer core
may need a specific corner for operating at a given frequency and 
the way that is conveyed upstream is via a hierarchical structure of
pmdomains, where the root of the tree is provided by the rpmhpd
driver

If the connection here is lacking, every requirement specific in the
OPP table or in the IP node via required-opps goes to /dev/null and
RPMH may do something between aggregating to a lower state (because
there's some other node voting on it by pure coincidence) or shutting
the rail off (because there's no votes whatshoever)

Konrad

