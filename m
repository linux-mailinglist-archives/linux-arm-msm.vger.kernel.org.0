Return-Path: <linux-arm-msm+bounces-114106-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Y/RJAbg3Omq74AcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114106-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 09:37:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 62F356B4E6C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 09:37:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=cyA4lG35;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=R4KbiEL0;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114106-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114106-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1809B30409C0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 07:37:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA0FB3C5DDB;
	Tue, 23 Jun 2026 07:37:16 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A4D43B6347
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 07:37:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782200236; cv=none; b=rjrh3BCO1Brzwd/xSsUhYMKvEa2u/GjBDQItME4xRV20EMZpEOg5S1iMIEejLMGZOujuCUfS3Vo7OOSq5qI0T2RwsEu+vk4pFRxUgdV9+ZBpdPx2XTwNQCHNf9UJ0OVixsYjW/Xdk73p13gHah5GCStHVfKrUHbQl4cOFKPk0zA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782200236; c=relaxed/simple;
	bh=QOCpcMEw56ji54fCFwYkjpHPwR/ydyBCSRQofq+lBK4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Uw3yBH2vqPQNXVek9EOfJSYQyNQBUUONQtQ/UT1gFpqkIzH2kALv5OT8a0c1yviaRNZ8uAX1iBba35G80vLK+lifOAl/QFf9y7ZcYXtJJPXzEJ5H/CRq/ox5vrscXfIwBjYFP0M6Cf5uVtsYEepO5Koc60PrbxLb2KIYdfnckzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cyA4lG35; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R4KbiEL0; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65N6caWX3646651
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 07:37:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	saKpAUAm0YHRCWzitG4zcz7/l09UJ7iL8naDnDZT5rc=; b=cyA4lG35tS9U/fWd
	SQzw7tDRJiw6tglVKpCG1kv/qVni+i+KLAOd/lrQFlr1Aj5h/UPJrKcbzTVJU16Y
	2eTHkQHAf1nGW81lOxMK2IUMs/GAu5mEQWS1Z6r+Chqy43eAAyjKyLuTaPsij429
	cBzSmybAIYQNOg82pZ37mJSIi/CwaD60N56VEpbYjvBsrsnciqhYaVClwld6cOHD
	M6TEr8EhTz8sWoc1FjjCvjFN85c4pFR0qo37eCFsBS8DtM0lR0bUTZs9zhlCTQIg
	D0PNkuFtXxMMuxa+dv188naG1m9yiTQk294F2sH9RVMjLnqFwyS69I4kdDVYkXB2
	toxI2Q==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ey6tmu8ve-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 07:37:14 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8dda2dc6790so18822076d6.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 00:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782200234; x=1782805034; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=saKpAUAm0YHRCWzitG4zcz7/l09UJ7iL8naDnDZT5rc=;
        b=R4KbiEL0TYitqiyTaFe/Tfl1CYMdndJeF/Q1Vju6nWmHfeTJTb+txDjgkOap0ue54W
         ai+3DIYxHCPHxU5U/tqEa+9NhS9DacQssbGWwgcqkS7REiv/EKjwm5fytme72O9akCh+
         aKhKmtLC56ATqOXoWxLC+gXNrDFpVoRApebnbYPRaN1B+eo2lyDaJylYD9+foOAjgViV
         lQsqMxmGsCBzuMwX2v2V14IyyX2quX8eWbRbseUnIf9THmdUNbcJz1xbXuwQxprWXVpm
         vjn6SQHHz3sevhW4gqE3nMHSTG+DtExAoWHsZ84F3OCGAGo1E9Mk2aVy4XRyhN/o5Hb+
         NbkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782200234; x=1782805034;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=saKpAUAm0YHRCWzitG4zcz7/l09UJ7iL8naDnDZT5rc=;
        b=Poen6dx15RFdt/aw0AYaA3/05nfTr1uhdKJDZ+M1U1HzT/u/OWohqicW0hfMkH9DBK
         A+0MfqhuFspjPRSfNtA0U8zpYHp9V3XYCsd5MyYLYdjx1Pnu1uaajTJ6x8DA1RvMbvaG
         ERWBMBEsuK8xlArShfaTOxpPeVwwKie2JhMAj5Qq890TKurnAbcFlp7T1XuzC6dG7Ajv
         yQ4g0I4KMEbxc54Hyq2FgtbRxyMN58F5nWJ6cGVq4linVBGUiYkC42tpeo/vrmw4MBbl
         lkiFwpsNpgd8mWh7PZS2RS7Mjy0cDDKytLT4fOIwQ3SOlvVcgYiX0dT9OCIBlZLHza6h
         rUWA==
X-Gm-Message-State: AOJu0Yy2bN4Ch+a/1Rj/DxidK61k+70x+PYHwJsoQGtTG7q7RvssJFVM
	bfRzh2zaQQ2HeWa3l6Db58s3E7/49+Qyk2vYyuWir1ZwPI7vWCYNQ2yQRqqNKYyig6/RmAnGldp
	6ns/7BnbyRHEa6Z+r2tvwEHfVVuA+NcoMzaoIfA2vnx2PXRfEvivTx199Ut9XOdSwj13q
X-Gm-Gg: AfdE7clrlRtvskdB2MxeJDvktVaWBUeXzk3zGa+IGrIyp0WyGX6/EaL/TExKfjYpBPo
	Y9Z1oR0wAUTmExkamfrGIDngzyuF30d8dHmoG/g+ZOVO6ErE7JQqcFdJ1UzOhK7whBl9BvC5hzR
	jQyHoz7Ue3qtSayJy680kiD33WgCybsWvhVM/ZSdD80sXGJbzgvlz7wz1X7zzzTuvXPnZuKF323
	Zi5NZLGq9czTRr4J+I7VDvO+SghPOzhL3Y98W8E+UB2715vZbCW3p9qOmn0WykzRr+VcpC7N+k0
	HGNbx8A3tOlMVlAQdcHszHP9qmKyoJV4xrBXj4/c9tdl8HI+nwWcPNWKWGhHu73X2psBNXqjD8r
	6zKGS40ljrem2tmbST06N6KWa4+u6CwHOnLA=
X-Received: by 2002:a05:620a:4550:b0:8d3:f6c2:5196 with SMTP id af79cd13be357-925cad55e47mr428063585a.5.1782200233812;
        Tue, 23 Jun 2026 00:37:13 -0700 (PDT)
X-Received: by 2002:a05:620a:4550:b0:8d3:f6c2:5196 with SMTP id af79cd13be357-925cad55e47mr428061885a.5.1782200233416;
        Tue, 23 Jun 2026 00:37:13 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0c5e497fc3sm464765366b.8.2026.06.23.00.37.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2026 00:37:12 -0700 (PDT)
Message-ID: <003e16fc-4179-42c8-ba79-8d37eb92192e@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 09:37:10 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] phy: qcom: edp: split power-on sequencing by PHY
 version
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260622-glymur-edp-phy-v1-0-814b45089ac9@oss.qualcomm.com>
 <20260622-glymur-edp-phy-v1-1-814b45089ac9@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260622-glymur-edp-phy-v1-1-814b45089ac9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA1OSBTYWx0ZWRfXx8ym3dG5k2Ir
 9ZCxmUpztmZVSAgFhOg++SY0NoreVlcQJxwuW+pOD+i1GzrHqwGQMOiLZVGQujHYLQ6qWzAqlWP
 cUBAY5xrKFkCJ/B5C2xXB5NGasw5UxU=
X-Proofpoint-GUID: iRtLGrV2O1nhvd5zJslcj5gO61fumo1d
X-Proofpoint-ORIG-GUID: iRtLGrV2O1nhvd5zJslcj5gO61fumo1d
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA1OSBTYWx0ZWRfX1z9WEf8YGqwv
 4SplKjstQmiIP4AH+Ehk/AS+bwLRR9Ww76jxQiMV/WF+xs/Fa5QdiuSBQQIcji/8OZ+J7zZzYuM
 dKOGkxuqQhFO7ug4EAv7z37MYzBaW6xDkxjXamSjoHgUYONdkSLDjzPKRjDaW5MIo5BzMPOPI61
 hKuHGNjNvXSnGBFETei6u6XNQ7YaegiPw6itTsZVvr/Z6E+gd5esgBh37asnmBDQ1MueCDr3GTp
 ZpTlD2fGmPI8fgxUUnmCMHGqkETtpDiQEOa8dbXgFrCMkEh3ByRoKXxa6aWcXZi480luLt6VyLu
 erwbsQhKRj+djM1U/eBwMRoPPulrIPF8iS4SInvW6X/taZh2/Z42t5v2Vz9k+PYLUhKG2N9G1sU
 Braa9Ve68Hh59Db7kxbKFxK1pCn8SHI0sdbO8xzn+o4m0wsGc+nDbkLjY9fjavevbBmBrtVR5+I
 Xj379Hw9tTFeP3qetIw==
X-Authority-Analysis: v=2.4 cv=H4HrBeYi c=1 sm=1 tr=0 ts=6a3a37aa cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=GWZ8nXm4iHO08dpYRpsA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_02,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 clxscore=1015 phishscore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606230059
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114106-lists,linux-arm-msm=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:bjorn.andersson@oss.qualcomm.com,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 62F356B4E6C

On 6/23/26 1:29 AM, Bjorn Andersson wrote:
> The eDP PHY power-on sequence has grown version-specific differences,
> but qcom_edp_phy_power_on() still contains the sequence as one shared
> flow. This makes it difficult to add newer PHY programming without
> interleaving it with the v4/v6 sequence.
> 
> Split the power-on sequence into version callbacks for the parts that
> differ between PHY revisions:
> 
>   - pre-power-on preparation
>   - TX programming before PLL enable
>   - rate/PCS programming
>   - lane programming after PLL enable
>   - final status polling
> 
> Keep the existing v4/v6 sequence as the v46 implementation, and wire v8
> to the same callbacks for now. This keeps the programming unchanged
> while making the next patch a v8-only programming update.
> 
> Assisted-by: Codex:GPT-5.5
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> ---

Look like indeed it's a NOP, as hard as it may be to deduce from the
diff:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

