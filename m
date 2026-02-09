Return-Path: <linux-arm-msm+bounces-92231-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6OV6FiWiiWlU/wQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92231-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 10:00:21 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FB6910D4C2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 10:00:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 989203012CB2
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Feb 2026 09:00:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE881326940;
	Mon,  9 Feb 2026 09:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k27d8u/Q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jQ5VrYzg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 764AC32692D
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Feb 2026 09:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770627612; cv=none; b=PgP5cE95Vj0ptAkE99rZsaTdDYf7W/fSpVov/GD5zBXKijwBiNor+EsnugLYU1Y2rEoDsF3hu99xZru3WFC2e1V/ARF5ti9y0BfyGWe0CeJ1CYvQRhNbQeskiSQmV9edB3+VHhJnCs8r5QDBf1XqftZzs5y0CYjplzqawGZMC00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770627612; c=relaxed/simple;
	bh=o3hy3qottVA9GM/oRWxUfBww9LKepO33PIw+6XQn5EI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RAqgpCtPqKGm+PeAXrN0ciwVTDIzuTGmAApOzDJ/sSA/7pa7S5ZO8rKGEdDY7Ddqp+Vhn0REDtemFMZiiqPAfaifsDVN681hA1ZbnKwy/t90Jj2Wi9aI0R7wkrhDJXZjPkp/Fnp0NK2xlagMwfDAzjF720zIWO1UAemEQ28o/iU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k27d8u/Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jQ5VrYzg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6194T33b2599731
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Feb 2026 09:00:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rsHe/eCYXZfn+o6g3cKdFK89q6nh4pHcLJ8DqEGc4hI=; b=k27d8u/QNzSV9Ek9
	KxUUl52EAEv/kO9BqfAjHeIfjHmHoMTO/xNa+sCKZFLfZjv4/Rqxgagmu+MLSekC
	hV5TAdrT+5sjfbsi5Xd6rnWPCpx7G6Ex2RHsJ21JdfdCYRJbVB4nkNCI5FiVNxyW
	hfziXgpgh6QOHkwbVmZZb02Cw1QGTCaVbNUBdc964KtVAFPbwx29xH2DmuhJAq+o
	YZMyIlipVfzAIaGLdG3y2h5o7BkClKTDE5Sl976Ie7HVb9AcXc8LF2zSzRVgEP3u
	iUwVoRqFdE8aZG7E+PXRC8Zmbc385Da3Ukj3Kl1b/B9lN5n2wYpz4orUmcbX7khF
	P2QjNg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c78kh0ug9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 09:00:11 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8243ae83898so1333836b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 01:00:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770627610; x=1771232410; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rsHe/eCYXZfn+o6g3cKdFK89q6nh4pHcLJ8DqEGc4hI=;
        b=jQ5VrYzgWupxdnUoaZFeaQjDyP4rvoISr9+JL2zwa5F60/DLcGu4xXgBCp4NIZ8823
         48EpAlhYmMuGj7YVfedS4X2B0vFcCxsmuiDTt0aQ4X2vxh1r16OVi5Y6HvVslfd6W8ju
         byDp0SyLTyvruduBYd7U4kQCyvD/AGJ8A1tzjogMRlVtcjb9InJJRK2NWnC9Df9yuOvn
         9aCIrDzSWq/B4rUulxktomcbiChE2+E55Xz5faFMInpI7fyR6+K+NlyptkNq1btqiWNT
         Te+fbjr8hQYeQu8N4FwyK0Sxo/Z1+qzil9gETYuOMuSlDNuRVUBkZgsFNLZLycztiYo0
         WCFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770627610; x=1771232410;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rsHe/eCYXZfn+o6g3cKdFK89q6nh4pHcLJ8DqEGc4hI=;
        b=WhwEgukaTMyDj0yppRp2gQfFa7Q3xgVox2xfNE8YpQNAjMPiR+Fz1NEMXFSLMaOBDs
         0FDB3m0NJaHWQdPJ11IhDGzjrCmG8QNHFosEzsCFJV7iFMKgJxFM+a2ZIO3FIQvRxjyY
         F/SP2m9we0zrIRKHaHHGdu98UgQkwq10bibnvxXkIMSmUTmo99W/7hprrSE4QHJZljz8
         79ZRXPZbGxaT060zLSE4+/Sxjpjp8NddcAsSofic+yQ94VPoigJPbJNryG1Hv9m4kSiG
         OnSvDX7YDWib6GcOlJcsFmtGgtckuZMCSSDusQgugfJebRhd4qynqe8SF7Hmne2Td2HJ
         UErg==
X-Gm-Message-State: AOJu0YyOizWGRkr+mgDI2iio3qlEcFolX0r/YIzGZTeFQnR+H03oObwQ
	+GIfNkKxMZs4qDy+eEIm3jaW0II3sHY9ltOYau+A+VN3YAHSA9wZleI6wtm3qjAKkvwHSKe0oG/
	2ydD/vMOjKfuzeD1xtUWubIFMmS14iJv2PFOca6uAKMTxuCDHtjaVSzwph8oLQ4yxk5qP
X-Gm-Gg: AZuq6aIHnmGMnkS5JkPQ10UwNwNvPnYSe/koyi7rLvIw13eOQMr7iZ3YsadIebJHHQq
	mTgwZIJc6vNfzplwlwc8B34ZdUz60n51/Uga35+XTXMdxqPNDG1kS0fhjtInngUj7ulPvFuJEgi
	64SVRsrmGnugEtPpwQ2Y1WxwoDh8lIafLM6WR/PeaCAiJvzMXkYGyuhzCdWs4xK5rldhLf4sSG8
	3kOS1CoBt9DdbYaJgEHa8bywHI/SReGbKDmYN3nkpoUQyHp4ZKmRNWzINIPJ3pU9ShEDirFLvmP
	U0PlY5DdLMaPrhSu0AGgN6Bjf0j8V3Zyipt7kmXAwGU2HPgrKsNYa0cv3dSc98lydgvlJ7NdRLz
	hyuZqCXQ4qgWsaoFmBEV9js7iXaaDOORjzYEs+vwgEsOIdvRNNphmP335qoNC3J4h49y3bLhSKe
	hB8Ic=
X-Received: by 2002:a05:6a00:21c4:b0:824:188b:c173 with SMTP id d2e1a72fcca58-824415ff154mr10083402b3a.5.1770627610072;
        Mon, 09 Feb 2026 01:00:10 -0800 (PST)
X-Received: by 2002:a05:6a00:21c4:b0:824:188b:c173 with SMTP id d2e1a72fcca58-824415ff154mr10083329b3a.5.1770627609139;
        Mon, 09 Feb 2026 01:00:09 -0800 (PST)
Received: from [10.133.33.6] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82441675468sm9304804b3a.13.2026.02.09.01.00.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Feb 2026 01:00:08 -0800 (PST)
Message-ID: <92556aa2-607f-4743-a480-19458836fffa@oss.qualcomm.com>
Date: Mon, 9 Feb 2026 17:00:03 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] phy: qcom: edp: Correct and clean up eDP/DP combo PHY
 configuration values
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260205-edp_phy-v1-0-231882bbf3f1@oss.qualcomm.com>
 <20260205-edp_phy-v1-1-231882bbf3f1@oss.qualcomm.com>
 <1b78ea12-84ba-467e-b541-1ffd2348f38c@oss.qualcomm.com>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <1b78ea12-84ba-467e-b541-1ffd2348f38c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Nt7cssdJ c=1 sm=1 tr=0 ts=6989a21b cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=UlKCwhGw83CaZuK5wCwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA5MDA3NCBTYWx0ZWRfX6pdD/nE0Ys69
 hRm61LDVw5qcldA3F1d71gbMpIfqd76s2A1q0HQj3eOGERuRpnGKr0/Kja8kk94+lqrnCCnoWJu
 mGU+vsdxSj2fRruQLKr493o+TnUlEhG6Fgj46K/SCaeMSXdtwESCkVJ1ra8IsH1M3UVNF7MKpgI
 cKtqD4EfrRQLbWO+FX7VdSevgojSupe8aZdMx8eW6YwH9lqtOkGGXte1gYuaIfPMr3c5ujBzwY1
 MjHoojzTpMzH1n/E7PsWRsQ9nj3jn3xTORKM+qVKBnquXCpPdytKEvHIFilsxyII9C5fhGcIOKO
 JpuokVeyjJ5pKZljkLM46vbddTBFLsDg1q1lTvGBleXtCTKUPDfjUCgCe9IlTYvcGHvcxvLwuF6
 kc6hD6c3FmmXa88K+ANsJ4OJRYaH3B2Auc9gCSaHsZ0Z0CWxicLTZLvkFqd1p0FZY/9kJ1lTjdm
 hZAzgFq1p65YQ6CNBOA==
X-Proofpoint-GUID: sz-nZXwTrOu48dRnei1Jjnfb6_NjbVzH
X-Proofpoint-ORIG-GUID: sz-nZXwTrOu48dRnei1Jjnfb6_NjbVzH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-08_05,2026-02-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 adultscore=0 malwarescore=0 bulkscore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602090074
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92231-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8FB6910D4C2
X-Rspamd-Action: no action



On 2/6/2026 6:47 PM, Konrad Dybcio wrote:
> On 2/5/26 10:20 AM, Yongxing Mou wrote:
>> According to the current HPG settings, most eDP/DP combo PHYs can reuse the
>> same configuration values.
> 
> Even across the various process nodes?
> 
Emm,Currently, I have only checked the five platforms that already have 
eDP PHY driver support enabled. The results are the same as stated in 
the commit message: in DP mode and in eDP low‑vdiff mode, there are four 
platforms that can reuse the same settings. The HPG I used was the one I 
found on IPCAT. Regarding HRG, please move to next comment.
>> DP mode：
>> 	-sa8775p/sc7280/sc8280xp/x1e80100
>> 	-glymur
>> eDP mode(low vdiff):
>> 	-glymur/sa8775p/sc8280xp/x1e80100
>> 	-sc7280
>> The current driver still keeps multiple versions of these tables and
>> doesn't fully support every combo PHY mode. This patch removes the
>> redundant configs and keeps only the sets we actually use, matching the
>> platforms listed above.
> 
> I see that e.g. eDP Low-Vdiff swing setting for RBR is:
> 
Hi, do you mean emphasis settings, i don't see 0x11	0x12 in arr[0][1].
> 		hamoa	kodiak
> arr[0][1]	0x11	0x12
> 
> It may be that this changed later during tuning but it's not reflected
> in the docs for kodiak
Emm, if that, where can i get the correct value for tables.. In this 
patch, I’m indeed quite curious why the values before the modification 
differ from those in the HPG. I’m not sure about the reason. The HPG I 
used was taken directly from the current go/ipcat. Could you tell me 
where I can obtain the final table that should be used?
> 
> Konrad


