Return-Path: <linux-arm-msm+bounces-107973-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cMe4FHOaB2r/9wIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107973-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 May 2026 00:13:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BB3E558A04
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 May 2026 00:13:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B2206302D53D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 22:09:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 727A63EFFD2;
	Fri, 15 May 2026 22:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Io9+h9rw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ePf8g/PB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3B123F39DB
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 22:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778882948; cv=none; b=kebXvDjHYfs9e58UHLuSa8cfqUSwMXRKL+vLHzoitcjkFJkSmCsocruUvmTaZ4ORgoOerNn2wg0ts5tpU/QrxvIDjbfU3UcQdvyS6qWG1oGPu4KeKBZ0vRfINPqn27dAdWIDmOZtAhNLrOnTY1LpWvpMj8kOCOU3sl4rgYD2tV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778882948; c=relaxed/simple;
	bh=IET5AU6rrRRsH37Au+nEzTi6bqMiuH7lodZQGEdsPl0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aLbN+Z02xO+yzlJN2cKtK38JlAYg3J4++ypCi6VR32AXbVBfC3NQbpzQmQBH1453uewbjAT/ICQsWnA4OIo+tPmqBFIy5TDbGAOKY0YoURbSH4he7VVlsVLKmZuIiUIxgC7U7RcpQazttVS41+BtkSnU918rxQs403YTqb/VT7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Io9+h9rw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ePf8g/PB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64FJedC63065777
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 22:09:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YaMH5hmIAD00xqSHsQUa0nL0jAccvNpv5cFUjemkwiQ=; b=Io9+h9rwNtHe309S
	OVH+h6e78ujukoFG+67vJwR+0WA8GGWvkfs+CED7kM3wyT4k1v9lowfjIPwi1Zk+
	+6HG0ljCnzxDh37PtulhGakMBC3hAWzzqfiitC7kHCE0v8DGQuUOaLNBsjzd+0Uy
	tYfqFXE0S9X27qzlkI+MDCeT+hPOdA6OOb4QT4aQV4l03YH5e79XLqGMN/4p1pAB
	sRgAncfHAIY03FZYu7dmHCywYpzd1GvogS7gldtYuJEwrzQMNw31J+Np9vja47pj
	jyosMCP8W72ChGMJzytJE4aK0CiMbUcGRbLGSOjoEupsbn08EAUyxNsaOnW7tihV
	XD5tWw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e67berxk1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 22:09:05 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82f756ebd0dso158088b3a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 15:09:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778882945; x=1779487745; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YaMH5hmIAD00xqSHsQUa0nL0jAccvNpv5cFUjemkwiQ=;
        b=ePf8g/PBQg7UsE9819vV4XxfqtpAc2pqLXkIekwsE03yQrc2+bIXxepTe4Jgwq4UiU
         qKfdP4xM/op+dHrJWNHDFLkKHesNM6dp2T36zKuoMmYcBSnIjfPiTwn6AcU5Hrr87q4a
         agJd8MODLlaneoWFOUzdwq+YAHY+bJEcF3J2i1D45bcDD1e90SADvPOJM7QYBkxOyfB/
         bc90SHa1hzxBJ5xeM4hRr0PSiPE/bLk7F3dV1Namsv8W5J/SMk9FRW2DrElWbDs8ujyr
         zRjZDI6F0mvpWzgLkzLcBYTVweBCuYs67ezDnypY5EZEHK717N+MWJs3wYot/H6ItGtd
         rx4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778882945; x=1779487745;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YaMH5hmIAD00xqSHsQUa0nL0jAccvNpv5cFUjemkwiQ=;
        b=qrARWtcavoOPN6oBG73m941QErqeO3tDg2o47VEBpCF8N0hHM1c77863gujouQx2JQ
         plbm/mUeaW2JqqcGupO1oEvtZQK2+OLpU5IOeI2MGhI1hK7teXEHlcQg8rRdwgr047bp
         KSKk0QJKcEG1EotC7rF8UdykHabEgL7B2yBbNIP4jbYMVBuZ6MzHfVmuEpDJ1K7aFhxQ
         TQi2LJbUfz1+cunLxLnf/Y8EMv65N0oGfLTEcTGZvayWq6PfNNJxAMrR2WvB0X+RX4Q3
         C155J3ZZTcTv8GyRJvVmA5hhXCV7B+NiKBu7nqK4qkxmjI3u6LMqqs/R+TQXIJUbKL3Z
         wenw==
X-Forwarded-Encrypted: i=1; AFNElJ/cY2LOdm+XXu6fanmkW1rz1wle4hOy4TWLCkprdUESyXEDbIXLsXFDG5YN0hYS5YQ80fSaRiP+SP6Hjyyg@vger.kernel.org
X-Gm-Message-State: AOJu0YwjyVleNpwBL+dBXShQoUcoHzQ/IfQEcN+edRwmiy2zcOsfiV+W
	GSlgMtevr3cBFInwYw5ql6Fl8P/TUyj14RVZCt/t1/HjZlfj22jrMsM5EEjLLUMrpg6qXxble+v
	qtxl/uG9a99rmzNSV53QsFwdUjEr5WEuz4mDSf48DRlA8roFXlxWnk+UsrcxwjEK/q8gT
X-Gm-Gg: Acq92OH/bY2+hnuLCuvlFkNe24pXeMAbfTaiNSNlTaToL2HQ0kweQaYre2M2+RUqLp+
	inF25PCFDjzJBbUxW1TC61C3gOc1bNUx5BPEcVa3VuLSk8e6Kjh5/A7CxpXpIskCqcBoPdr1UVh
	Qrr4Y7uuU/br6doRYPmgy6be6nR5jjrB4nf+XYngHHqqKag7RrBVv/KNuQDeobLQA38xLjNcWGb
	MyJi/H8jP4IIL52wyYgIiYm+IcWqVi+CI58kmSjkTq0TQnohcZmmNLWsIfGEE6MSFnPN+GDgkfs
	d6OIti+wsFPTgle5r1FQ+wb8gmysFtaH6QyxhA1n5xrbPoPpm45ojLsFlLLUEoQawa1AU/joLgP
	54CeAPQ8A0bW3Xpf1m8OhhGX1o4PnRVlUFoXB7xQEinc=
X-Received: by 2002:a05:6a20:4305:b0:3a8:2339:24c4 with SMTP id adf61e73a8af0-3b22ebed4a2mr6668412637.26.1778882944663;
        Fri, 15 May 2026 15:09:04 -0700 (PDT)
X-Received: by 2002:a05:6a20:4305:b0:3a8:2339:24c4 with SMTP id adf61e73a8af0-3b22ebed4a2mr6668373637.26.1778882944158;
        Fri, 15 May 2026 15:09:04 -0700 (PDT)
Received: from [192.168.1.3] ([182.60.13.113])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c82bb1156absm6447536a12.27.2026.05.15.15.08.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 15:09:03 -0700 (PDT)
Message-ID: <7d3dd8b9-8411-476d-a1ef-fdac476a1515@oss.qualcomm.com>
Date: Sat, 16 May 2026 03:38:52 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/8] arm64: dts: qcom: Add GPU support for Kaanapali
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
References: <20260512-kaana-gpu-dt-v1-0-13e1c07c2050@oss.qualcomm.com>
 <20260512-kaana-gpu-dt-v1-5-13e1c07c2050@oss.qualcomm.com>
 <14a2fbfd-97c1-4ba7-aa51-a07134102d3b@oss.qualcomm.com>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <14a2fbfd-97c1-4ba7-aa51-a07134102d3b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Q59GD_dZVvFuHs3NjDerbkuLs0RbZqB2
X-Proofpoint-ORIG-GUID: Q59GD_dZVvFuHs3NjDerbkuLs0RbZqB2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDIyMSBTYWx0ZWRfX43S5/21P8YJF
 lwgLDiruKRlBX5n3C9SlfVCC83t7VCxKsLq+ou5LH3NkxsDDNOsuY91JYkIPCfHBrjnHenBe6yf
 5iNW8dubTaMixJM4NxzKNQGpScuAMVdjYcE2CUzpMhkLzGDb+9z4QbjQ1LMGugwfrNr+6x9G/pp
 5uV+apNuxinSaKSUNfAoBZoYv+1/lTMhs8+BTNV3LtKekDV2IQ5KCeixq8TKRL5d+MBGqUfuVxQ
 YRdKnQuXuTnkOT8r/nXtcWudlPJzq6J/RDuw4ZGd1aDW5CrJ6KnVTzBKQXzruW+SHFdbF66hg0O
 WkAxGI4WsvL4BK4nM+93ltSKCnXgT6htN5kUAaNscyD+BLsT50afPCWk1XhSjgRTYJJQuDzBhpF
 TR+4Vgq4/iqS+WwMWm1p4lSVe3cgrXXI59T5OZZCQ0TpO42qIfRS+IOggu6KvPx31rwa60J8TtS
 E/Vx8RGrDYbG/OJ/jMw==
X-Authority-Analysis: v=2.4 cv=IrUutr/g c=1 sm=1 tr=0 ts=6a079981 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ba8plz+5YpscmDk5DVa2Cg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=mzNi1YEEKYKHT8R6ei4A:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_05,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 clxscore=1015 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150221
X-Rspamd-Queue-Id: 8BB3E558A04
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
	TAGGED_FROM(0.00)[bounces-107973-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[poorly.run,lists.infradead.org,lists.linux.dev,vger.kernel.org,lists.freedesktop.org,kernel.org,arm.com,8bytes.org,oss.qualcomm.com,linux.dev,gmail.com,somainline.org,linux.intel.com,suse.de,ffwll.ch];
	RCPT_COUNT_TWELVE(0.00)[27];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 5/14/2026 6:13 PM, Konrad Dybcio wrote:
> On 5/12/26 12:23 AM, Akhil P Oommen wrote:
>> Adreno 840 present in Kaanapali SoC is the second generation GPU in
>> A8x family. It is based on the new slice architecture with 3 slices,
>> higher GMEM/caches etc.
>>
>> There is some re-arrangement in the reglist to properly cover maximum
>> register region. Other than this, the DT description is mostly similar
>> to the existing chipsets except the OPP tables.
>>
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +			gpu_opp_table: opp-table {
>> +				compatible = "operating-points-v2-adreno",
>> +					     "operating-points-v2";
>> +
>> +				opp-222000000 {
>> +					opp-hz = /bits/ 64 <222000000>;
>> +					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D2>;
>> +					opp-peak-kBps = <2136718>;
>> +					opp-supported-hw = <0x0f>;
>> +					/* ACD is disabled */
>> +				};
> 
> The clock plan also has a 160 MHz OPP @ LOWSVS_D3 and there's a couple of
> interim OPPs that you have that aren't part of it (but maybe you have
> better docs)

I somehow assumed that the 160Mhz was a thermal-only corner. Seems it is
not. Let me revisit the OPP table again. Yeah, the doc is outdated.
Looks like there was some last minute updates to the OPP table.

Also, we should update a6xx_hfi.h to accommodate more than 16 GX levels.

-Akhil.

> 
> Otherwise lgtm but the size of the GPU region and the GMU base look
> slightly confusing when I'm comparing them against the reg map
> 
> Konrad


