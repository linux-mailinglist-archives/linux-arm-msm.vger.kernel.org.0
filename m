Return-Path: <linux-arm-msm+bounces-107755-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EOhSKFXmBmoHowIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107755-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 11:24:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A41B54C5BB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 11:24:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8600C30C1BC2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 09:17:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9285436375;
	Fri, 15 May 2026 09:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xx11sRa2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U+B7j853"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1852742B72F
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 09:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778836667; cv=none; b=aNnEBHEntcIx59nQZeldKLufimlgajKqCWYVRntpGzp8M7Jjxm0h/nKyhXZmgA55RZACs5tfwpwgOBc/FOzSAlTUa4pszkC+b7pJzwdSa0+caxg3/x+JIgo6WjpT3uKvE1nwK/HeUNWD9ODKYQRzmecGckcM1uwabwHtgT+g8v8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778836667; c=relaxed/simple;
	bh=JZTw67nNsqgHy2aR+AH+SpVsT+MYJ6AXI/iUpn9bhsA=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=g6aT3LBK07fQHWpyVX7Y0T9m4fHcF8vldCdqNtzB90PhO/mthecEYZVXm0ZHr/6vPv5DBO5HG9Q/T8trBDczGuWE5LcyFOeVEUlixyx6G/y+l+a1raHqttMFFkC4BN4VAZjoMVvHmheHN2XlCRpeotmEhhECGmEyv83ZhnNXGNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xx11sRa2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U+B7j853; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F4r0Ak3200106
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 09:17:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RPVEd5Ws7PMkL2UvTGYvywwSu1vfE9SuAGTbdEXzWeU=; b=Xx11sRa2zySAoaeZ
	JJD1orXvUJtsm9aX2C2iOtVJR7W3tbxneykSHzsu8qXpFY+YX3JNKpwchA4f7sU+
	+MH7Jc+J5+G2WbnFUoFUayxQD5movL2Z4PnOvwUkLKsg+VU7PN3lf3jDABMsBdqk
	bAyDf6cUr16Z8UtG95LDY9ME+YCKJJIK0k5H4IqgqARX8F9t/MYRzD8GLNz4MgEs
	ysYwBsAHtqfHZza7mhpIKXWwfXNwoAWI87w5C2oDugX1cFr2XV3wpPlrFzh2y6EO
	HSE6WomD2795xwg6FStTU0pLFqTp4IAF+9O1bGwIf1cFlP7dbk6wz+aSjMDj0OUs
	kxrbUw==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1qthwv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 09:17:45 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-575597e1259so198050e0c.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 02:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778836664; x=1779441464; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RPVEd5Ws7PMkL2UvTGYvywwSu1vfE9SuAGTbdEXzWeU=;
        b=U+B7j853M9EaXdq33jX2shedWvuy4xeIWPMiQhUZW/alLKhF6bBsSeUkQjKP/wijX9
         dD8bwIiRkv2SEwXEtFZYHMkslFihOVOUSqLzM4z+mpwqC8QqkPu4Xpu1LjqMvg8mc6Xq
         PfS6CCQGOIeZ61Z2T9Ggw8tMxKWzX+s3pyM1kubDiWcLlvaIx1aIT76xxe+41XgGYTOC
         3WFwkvYCeqvsDCoFqHODakQq7G/c9qE3K8gFNUuc9mvobTqrfgQsQWv//SfjWxKx0cA0
         uNXl0sUPcyq2miQBsyiW//ny9biuUWTnm8QxCveD/MLQ4XAuLDxqTrpiNr2m+EMiUfij
         WypA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778836664; x=1779441464;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RPVEd5Ws7PMkL2UvTGYvywwSu1vfE9SuAGTbdEXzWeU=;
        b=f02rkYLsVgX+BlpuxJFzSkGLvKPkYy0knpJZ3dRqhfrGLm2QYUukI46JSnF/9EaxYj
         hja8R1fa0x7zAB9KnzCbHjSZJJJ2JyBwmaYjXb0flPTfe8GybWPCJMwsrAmHdmRvTn8k
         Ar9j1as/WxR8sbwxZjGE3Omg8twEhPKAWw78J2/pF1yPIw02Ii5uSv915NcIZkb7IZuf
         knkRylrasD8mydBiZOJNe+tLM3M52kHTgpDnzH3202GbEgRVt2ERDTVz2odh1Axssey6
         AYQqIVHMXGPdwO9y6xCoZa5VyBWBglo7fPD2+VUaf7dxbNkB+mGD5HNVX0nZvgC1mRv+
         QkVw==
X-Forwarded-Encrypted: i=1; AFNElJ8tsYcVxT9rRYYyZa+zaKiPKZ3s7VwW1dyv9wGmDMHjpR2T7LUVRvPgj2/jahAjTXFDt5kKynHa2jAw3Cfp@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/fXA/4IhbkBQtJqNCMWu1A1k4H0uoFWdgddG+iRK9DX2E16aN
	l0BWta4XVS8Z031M+FBTyAqaJtBS4/YvC+Kbr4rwh6bKt51Wtjf1QiVwwi62kLict8OYTeino1o
	uQByosfxeRq2C5TTIR8EHWpJzeMeJZHhghVckIftS05ZYXwtZuditukz03bLjMJFV0fBG
X-Gm-Gg: Acq92OGVExW1EpmjuNIoOf/BjY9TyJycacUSN+Y22fYVH9YnjCF6BHahpL4UqO+8Ix8
	pe5wEnWZImqNd/A9gdPKOCwxoxkEdG91k6cNdt1KDqc//6Of9IL3X42A7Qc8XSN62n1ScRnxzxD
	AFOdm/kLpSnM0qtLCoX67CMqgWdmtD9GRzjysin4tJOD6hfmRVae1mTQ/5c0cDXXLhqcpLRzuiT
	umEnzdvg50qaObXDgcf3AWCPxRLCTlN6GohvxA+aoTpVnieJnDZzcEWvXN1kG3rWtu9XQozfkND
	d61UATtEOnXdXd+hwhAkhboWbMmzY6CvcUvCnxo9WEsNLBrb/XaLLlKsfkJOB/+n+sRok7ag2H5
	a0qDRBaikEonVGR+flNcghF61n6KoDU7ITt55aIJtlWfCi+DR
X-Received: by 2002:a05:6102:4a8b:b0:631:26f6:701c with SMTP id ada2fe7eead31-63a408b9ac1mr1501096137.31.1778836664099;
        Fri, 15 May 2026 02:17:44 -0700 (PDT)
X-Received: by 2002:a05:6102:4a8b:b0:631:26f6:701c with SMTP id ada2fe7eead31-63a408b9ac1mr1501086137.31.1778836663684;
        Fri, 15 May 2026 02:17:43 -0700 (PDT)
Received: from [192.168.68.112] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-bd4f4e21b1esm197389266b.44.2026.05.15.02.17.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 02:17:42 -0700 (PDT)
Message-ID: <9efb40d3-cfc4-4db0-9568-058e51292a40@oss.qualcomm.com>
Date: Fri, 15 May 2026 09:17:41 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ASoC q6asm race condition when stopping and preparing the stream
To: Richard Acayan <mailingradian@gmail.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kees Cook
 <kees@kernel.org>, Joris Verhaegen <verhaegen@google.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <afS7rTHdc9TyIeLx@rdacayan>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <afS7rTHdc9TyIeLx@rdacayan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=HbkkiCE8 c=1 sm=1 tr=0 ts=6a06e4b9 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=TA6Hy007wzxYe2ctAm0A:9 a=QEXdDO2ut3YA:10 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-GUID: xV_LtstjGht5T-cwkNGw93U0PAwl1f5T
X-Proofpoint-ORIG-GUID: xV_LtstjGht5T-cwkNGw93U0PAwl1f5T
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDA5MyBTYWx0ZWRfX5nToXHhvTroa
 2moSv8buQ0F4PFku4LMs24W52NtPukirZznhuODK3aMoCDxZOXWWH6tlFrAu7+ljTxQJkliTxLr
 4ELoGLhVmzL9ITnSFgJVwj9jaTLfRl7umCr6ON/Zhc39R0HZivV6D3isvLFK3ep9FudTS4fHndA
 ULEByY12+zSYOGhTmHsOPr1bU6tYq2clygnZpIFpLFm+Nj80xi3HsOw8+SLQ6gL0wJQjUyhhzWb
 nG8g3bYexGP21+ONgIAQTSJF1XcGwK1e61Y/+A5P3yre0xSHJuoYgwDlZMQt+fDY3cTGqg46YUQ
 Mf1MseInQYZb+9VIuR10KaNwRdKD9qYdKEVxI/R8eRIz6uZlMhHuGvqxqw6j8JviCdLuE/tWOQ9
 CY6D2pwo8S8fgdelXXwzxSmsM05D2m+7jaF4FA6aSRXX7fz9k9ij12tSt+VgDo70IwFnQFNnRWy
 /ImZXBPUzDvEN5QlF1A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 adultscore=0 suspectscore=0
 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150093
X-Rspamd-Queue-Id: 1A41B54C5BB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107755-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,perex.cz,suse.com,linuxfoundation.org,google.com,renesas.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action



On 5/1/26 2:41 PM, Richard Acayan wrote:
> Hi,
> 
> There seems to be a race condition in q6asm when stopping the stream
> (with uncompressed PCM). When receiving SNDRV_PCM_TRIGGER_STOP, the
> driver sets the state to Q6ASM_STREAM_STOPPED and sends CMD_EOS to the
> ADSP. If userspace decides to prepare the stream again in
> q6asm_dai_prepare before receiving ASM_CLIENT_EVENT_CMD_EOS_DONE, the
> memory-mapped region appears to still be in use and fails to map again.
> 
> I believe this race was observed since commit 81c53b52de21 ("ASoC: qcom:
> qdsp6: q6asm-dai: set 10 ms period and buffer alignment."), but would
> need to verify. On sdm670, we are coping downstream by keeping the state
> as Q6ASM_STREAM_RUNNING until receiving CMD_EOS_DONE.

Can you please share the full kernel log.

--srini

> 
> Can the ADSP emit DATA_WRITE_DONE or DATA_READ_DONE before CMD_EOS_DONE?
> We might need an extra stopping state between CMD_EOS and CMD_EOS_DONE
> so the driver doesn't request more data transfers.


