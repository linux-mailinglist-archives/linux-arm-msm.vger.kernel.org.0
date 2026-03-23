Return-Path: <linux-arm-msm+bounces-99413-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +NeAE6W2wWlyUwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99413-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 22:54:45 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BD3862FDF99
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 22:54:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4F384303EFAB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 21:54:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F0AF3815EB;
	Mon, 23 Mar 2026 21:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XOEFAbdG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KMJ1HMmJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D700637F74F
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 21:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774302872; cv=none; b=h+Tur3CIXJeEOa48uHVvv125LqbAY2064Pbi6MDzfNjvI1UO/csVksIt8VtuAOqiTpmPI1BWL9i6Wkv7xfxCWa0mdUVYyrFDqC/o9Zkplvh0XKTL1RfhP2gnsmv21cPd5vd4zK4Yd4w73hLlZCOi9yY/EywwnCJVByY1gU0p25I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774302872; c=relaxed/simple;
	bh=TQpM8ZYMbSxXZpcqP8xZsRXe9F2SBg0etEpBLmcn9mU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TfrPUh+i5ya3aptuWAWR8chvfwH5TlZ7X+xVno9SCp9QAfINbe8ff5xbZq/aXVGtQQzsr7YxQPOpO9DuSHIhPE+YyMovlnM8eSwWW+UQ5++MaxEpOGVAIr6JPuDljsnJwYE8TKIXCel12rP0ojPfgAosgU8ABCl29gz6fk16/Hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XOEFAbdG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KMJ1HMmJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NIZ5xe1909464
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 21:54:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Aev42t9lwy6Gs0aGpanm8SSlUN0xteCCmPHE0nknkDg=; b=XOEFAbdGZXAoLfyW
	Oa5t+MHsWnHPi5wY2j+LYRqboNaz5D+zdsXikmZ7KAcDVmiO8PyMOIT284MB8dGu
	g3IvWcZJMui8O1VE7qy/SJ7C+2yvy/wh9sbItOMS9E5SY98VsCB9Ec3qLKCuamb3
	7cRY8nyioYPcI5mo84HYlKC8RlnY2uTPP//phP8U1WwWebZscK+lvA/30Hcrrj0s
	FkluY8L1Pm/pT9N5nbcpIQb74ueFJMj/SrFLTUnLIyrZ6tGV0JuOCZ1ks7h9k2nf
	Ruuzdw9lb/w0oBSp2A0Mh1AUEHoseM/60LqxmEbfpHDpKecs8gyvpOFRJJb4PIXM
	ep4I5w==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3awyrj68-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 21:54:31 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50917996cfaso53144161cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 14:54:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774302870; x=1774907670; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Aev42t9lwy6Gs0aGpanm8SSlUN0xteCCmPHE0nknkDg=;
        b=KMJ1HMmJxoZ6kZR9CCEVXbrIpUZDOns+bKi5V4gBgFSazGnP4bsBGxgGsnAvSjfDuF
         nk3b9MyReALhrWKPbr+CIqjXLmb9dzyWdC0CtYdX4wDPNvJVCGff9Jtqqgjv9fSLIQ+n
         Rde0JExmUI0Yx+U4umLGS0JLwUe0PAV95oKSmSF0zhg/7KCYTNPYBKPJNBZuwVPafd9E
         WzOOacM0Om5xcDkBoSr2aWdL+SFWdr42Tw7HQFgzZxUWGY5UDLOXmccfaOqWu9MVMhSF
         XPiK/fp9JOUR8kULCJ/iapuTBriL8NF+/5Q7JwStIRGxUtBkaJFc0RbDb0HOSxVwpi8L
         CnQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774302870; x=1774907670;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Aev42t9lwy6Gs0aGpanm8SSlUN0xteCCmPHE0nknkDg=;
        b=Mtn9wuNwISIllv8Rd1CDRWU6WPkFIzIuY6qy9vILlZ62VYiIDs6yIHrDz3hTB+7AEO
         X556Qs9tk68dXk4JyQEYjt8UAbPwoikB5VkmBKgF9sfHaCIXxbkRqs69qrhGLH6S2ufG
         iHxT8GEYfR1HLX5IZwoFUd3dwmHbYn9aLp+572zzTktwBKPo71xwyk+paACyRgn1TEFV
         DXfODaahO2h65i05ei3P4TnWouSIHexOC+AIJZvsCMqZQaup8TeaXqDeW6ngQ5bslv8C
         l806KhH0VVyEmQMuBZfxvO210slsONAO7JAGVWBdTPWZ+6hhiMI3wrLIO4daepjXmOO1
         NxpA==
X-Forwarded-Encrypted: i=1; AJvYcCVPX5hSI6CuknWl6Xd3/4IkZ62s1X8jnnsGF8t0mONByFK4Wg6mrh2rZIvlBbNVABe3uteQrQ/ZexJaEqza@vger.kernel.org
X-Gm-Message-State: AOJu0YwBYC8g/imwnoNVhrYmgtPH1XMLWMIpCguejA8S84L9HtIg0q+2
	XDjCoDx/D3dV7dqq1VvyYKBVDsoAdS4hmRedeHRokxyUzk1D3OTstn3/Iyv+KcP5D5JxlkNkMvS
	/XrQhETPTl5IjruxvFLTmDe44wNXpo0pc62RaPRPAx/SbBRyzPd+rP1Vgu7cySVZNVrII
X-Gm-Gg: ATEYQzwPuexM2B98EHzEUGqExyUug09EPNZfk/QlPdL+k06amvuIUDqILauNrHGg5J3
	g/BWKVKj7LXB1VznVzWjA/LFQ3+v9EJorSAh4KZEigRIh3cZkatAQwdnCgJ+k2556UEHCwQsBlV
	5f7EJyPSpRvn5ZHOnXpXbXGGHOd3sufbR4YWUsug636BXhEUIdPJgNj1EuGZILfDBZPAImdq2tB
	y5QLrDgaHa4Ce2pi1ftgcU7bpJgXZWKLTb0CdCbCqCQmjL7w7ix4Xo10qYR8mlAa+uaDJ+U387t
	XeVLqVmRx3G7cO1Xub5iDj3ssgvX0EtwWMlNSE77TDkbTyjYDo7CA7wcwAJjbQs3bo4xa66dqPE
	Dvh/HbvaGdLOBup2pH3E8Ug2pTXyAvJnueoTMCJ1HM0wndpLK
X-Received: by 2002:ac8:5c96:0:b0:50b:5258:28da with SMTP id d75a77b69052e-50b52582b9dmr118725381cf.5.1774302870311;
        Mon, 23 Mar 2026 14:54:30 -0700 (PDT)
X-Received: by 2002:ac8:5c96:0:b0:50b:5258:28da with SMTP id d75a77b69052e-50b52582b9dmr118724971cf.5.1774302869902;
        Mon, 23 Mar 2026 14:54:29 -0700 (PDT)
Received: from [192.168.68.114] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-43b647177e8sm31794487f8f.34.2026.03.23.14.54.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 14:54:29 -0700 (PDT)
Message-ID: <0006e814-1369-40bc-81cd-241a08080002@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 21:54:28 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 13/13] ASoC: qcom: q6apm: Add support for early buffer
 mapping on DSP
To: Mark Brown <broonie@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        mohammad.rafi.shaik@oss.qualcomm.com, linux-sound@vger.kernel.org,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, johan@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, srini@kernel.org, val@packett.cool,
        mailingradian@gmail.com
References: <20260320144918.1685838-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260320144918.1685838-14-srinivas.kandagatla@oss.qualcomm.com>
 <73bbc9b3-d71e-4161-8d21-496433c24300@sirena.org.uk>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <73bbc9b3-d71e-4161-8d21-496433c24300@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDE2MiBTYWx0ZWRfX30rNZ2LYQFva
 khQ++eF/hhX92DVPSUMK/dxws6zVtckT966bLjEKS5Cv4UN0VlHVmH7mUOp9Qgn6uIzfqkn1dJO
 CyYzwW+dyASszeh+TrZ7LbzNZRXRuJuns/WIg/9J5ZkQCFqe0byWIh6He2QaQH0sA/WiGUxCGgD
 ET6X+xLSRgWuKET/76IOJ3RUp6HlvX5fG1tS6UdW/TrfkgsJ/4gmctNuwyXmlNfLAlc/Uv3gLy2
 5jObCiHKdmm3YyGaKU8BG32MHVWjMSjgXm3s6kz45nBNj3lRrsaikqIUDYE3gZo2NNXSuy4MyKO
 UyRi1Y2w113UyIGYulfhVU7ShrY2TeFtPwMVzs+Ey+8wZR6lGkL+tJymU0htKT0va41yfEP4mEQ
 uSw6qLbQhIu596HZ2DGGzd/TLb15DOz7Ow+9IL1ud43cbJO2mFVAYAGA24siKS5SwImt0EiTH/D
 3tm61e/QVjnEeimQeTw==
X-Proofpoint-ORIG-GUID: T1V8BdUs-AOjt-1zo9rRcSG5_ng16C4P
X-Authority-Analysis: v=2.4 cv=KuhAGGWN c=1 sm=1 tr=0 ts=69c1b697 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=1IEi6xrr0DJqppMnr98A:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: T1V8BdUs-AOjt-1zo9rRcSG5_ng16C4P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_05,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 phishscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230162
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,oss.qualcomm.com,vger.kernel.org,gmail.com,perex.cz,suse.com,packett.cool];
	TAGGED_FROM(0.00)[bounces-99413-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BD3862FDF99
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/20/26 3:44 PM, Mark Brown wrote:
> On Fri, Mar 20, 2026 at 02:49:18PM +0000, Srinivas Kandagatla wrote:
> 
>>  static int q6apm_dai_pcm_new(struct snd_soc_component *component, struct snd_soc_pcm_runtime *rtd)
>>  {
> 
>> +	if (pcm->streams[SNDRV_PCM_STREAM_CAPTURE].substream) {
>> +		substream = pcm->streams[SNDRV_PCM_STREAM_CAPTURE].substream;
>> +		q6apm_dai_memory_map(component, substream, graph_id);
> 
> This doesn't assign ret...

True, should have collected the return value in ret.

--srini
> 
>> +		if (ret)
>> +			return ret;
> 
> ...which means this isn't doing the right thing.


