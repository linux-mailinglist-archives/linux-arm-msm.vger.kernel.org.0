Return-Path: <linux-arm-msm+bounces-109197-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GOWxHvAOEGpQTAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109197-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 10:08:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 213F35B059F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 10:08:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1BD523008C1C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 08:08:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6C5E3A6407;
	Fri, 22 May 2026 08:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nigQhwFN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WoTDPwM3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FA7738837C
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 08:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779437281; cv=none; b=BKenlTGbylUEblVpWZA8LThuRb2nobTASOWIHn4pSKehfi5jFe9haOgIwI6CkarTfiQZ1QpSbS6+fCoBvm6Kn2Z1AudPPN9jJsYMYaUCzvHAkD58n6JMNQlXnq9F+88h0wB2maRFJ/kT5JgOfXn3WB/yFkD4uK3o7KyMmmm3r+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779437281; c=relaxed/simple;
	bh=BZ6hUYVA+hAdxJ33RvUIP1ixH7Z4ijfI17Oauj8tgts=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QuF51fopeVDYCmt0E6hVZF8Uff6BcpxxABmMqhH08GgCFI3fx40i5cLj1+5jezefWCJbj2m2n7nGA9hxA0qnzx4/KKfGX6vOGus+jJEz3p1yVkj6cN4T6nRqCvBa1YDdFDGTe2uDzD6iKAI1KFk7FzCW82omuP0nYt60aBP3dIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nigQhwFN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WoTDPwM3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64M7eQl42568729
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 08:07:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jUNAGYZb+CIimh/bVdbWuR2xAAKW9q7QdkIq+zmBuDo=; b=nigQhwFNgVIS4FW2
	HSIV6Qr34wdjCf3OtC3qxkBJ9I4Nukv5J3PS7VC7lid0xrc6UJtcAbqxtU5/69MH
	VJOnj35YXW8bj5DM+Dlz9ex7bEooH97zx6Qkl8DdSPSqYZiPlQeqa3jx1Vt/6Vi8
	Ii1amrIMYeBTqx9NbX5eijxY1Q5DcymLZuhygVPYWhK/vacwaTVHt61FtsamRICk
	tL78e2lLO2ONyERZOZHLlojPZdCM4/qUBLZ2wBcdRLXEgMKoVAmIt4kvpiQWdcNv
	zPwStrYwaduSCH34cRs1BfMA7xDP0PEps4zW/sdYD7kKf+yHKzqQYd6FKUKsFDPR
	qNqtLg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ea0dkmn72-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 08:07:59 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c828cee4fcdso3504324a12.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 01:07:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779437279; x=1780042079; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jUNAGYZb+CIimh/bVdbWuR2xAAKW9q7QdkIq+zmBuDo=;
        b=WoTDPwM3i8y8vZA9uQaxR/uJUhIWJd1ZdicmaRr3BdlNSreVOHITrO/sEn9BWSVez/
         yYZTK7PCbD2d+0hkk21x8vqQLIeJyMeHhmI2yv2TLlwqDN0Bn991wyg6DV54yzFKewgC
         aWHKZ4RE36YgIHkyRmeLsEi3ZHtmXAzSEgekKQbVhXfVy8So56+XYyC2FCkO2Do34W2w
         vahxxQWgTFC+YAtg3CAgXdmnl6BL3KUT55GaaCl50OQGRObGMa9SsbyGMEp8DLFHe+X6
         toGVdxB+eJ7D4hiLYXAeFy7M47YTKuRm87dQ0s73nuw0V99sJVZyQ8vcpxCr4wpZdH3M
         U+jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779437279; x=1780042079;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jUNAGYZb+CIimh/bVdbWuR2xAAKW9q7QdkIq+zmBuDo=;
        b=hE4Exkav/zfHK4iMWf87pxTrCRdqHCwbh6Ub975mJDoNPgTQPUfPMUZObQaTu5yGDn
         L6KhPSwDV5DIT23kktHDrKHh5hAYagryo6/eE/NrGQl72ytAl05ists7aSdhnknkzpnF
         QfP5hbsRwYXGAd1HvmLj2ipYQ+FSMw4Sk7gr97xgKktbI4M26igj1S/7kmpbKbX97wHW
         fUv7AQefckojhLF2qkU1F7Mw9PIEICrWhBZNOisI5O69ZjIDfnufhj6E/IgfkqHFdtCG
         rMeO75lJvyyJL1vpKmyUvbfi10tgO310VCibhzXwcl8dUqkZpwOw2TwvkCNvXX5HaB3n
         Q+3A==
X-Forwarded-Encrypted: i=1; AFNElJ+swqqPxj84R/hEIsyxaYkrS5QWCKqKStE+w0YsZAZ7RKZICVvDRmiwoISNey13oLfUD2wWz7selmaiVdKV@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+WgZzc83j82lq0wRXY0pQ6FWfF25ygeih72dKDTxWjPNeCU9X
	c4dFu6r1QiroWzy5zHgg5ETvGejZhgih+BJUegQ2xN5lSvvWTUp67z3/YweiJvVncNrWFdxfMHV
	CsjI7yjv4ZLU6xgjGEUZ4ObE/4lHHdZiPifncYpvhIw6aGeBlfZbZMgZ4ZvHK8c9OFe2i
X-Gm-Gg: Acq92OFtzq9urbm/SX/MokDIDKYsgLRryoV0VK9D9jlvP8mF5ElrS/HKEzZmiQGSOWd
	elv8UIthKO0QoDxGyGZWLG5uh08xc8Ud/d3dC+/nVXJGnKSmyPNv8sq+AvtqwEx7wbkqbOSiCiB
	0u+YAv3q4QgQQWZKJBN7rwn0vc04X/bed2zkwaihXSC3iQm561AiwfE8OhibyXzZ5Rkq4voPdEr
	+/lmLEZ71QDG5T7yHg2cH4/C3RqEUmqcBR8xCCJTu0GkVin5X7Ghdh4mQGVyeL/V+4+gfgCzKNo
	vgQH4bHdmVHjSH3gtlelZHm5X+pwm+ORHir554yunAFWKpdR4f5FRfiDqMD7LERyfyo0adSPELc
	gc9U5CId/QBLXRiSQiINwKh0STd+/AoGo+48Oe6rdFCl2/QKfznDEwsPIrBodhif16oq8WCbjLP
	GnGjyQ+x4APR74AOC/hA==
X-Received: by 2002:a05:6a20:918a:b0:3aa:c93b:6266 with SMTP id adf61e73a8af0-3b328c98e37mr2772599637.19.1779437278972;
        Fri, 22 May 2026 01:07:58 -0700 (PDT)
X-Received: by 2002:a05:6a20:918a:b0:3aa:c93b:6266 with SMTP id adf61e73a8af0-3b328c98e37mr2772552637.19.1779437278436;
        Fri, 22 May 2026 01:07:58 -0700 (PDT)
Received: from [10.133.33.148] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85205855dasm949585a12.31.2026.05.22.01.07.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 01:07:58 -0700 (PDT)
Message-ID: <c5934946-d2d7-4bb3-86e7-9de11db5e85d@oss.qualcomm.com>
Date: Fri, 22 May 2026 16:07:52 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 00/39] drm/msm/dp: Add MST support for MSM chipsets
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20260410-msm-dp-mst-v4-0-b20518dea8de@oss.qualcomm.com>
 <bmkdeyquoyvcwcgucijcxmgnip32fs4gyqe6gvponokwiu55cf@7ncsbggx23ar>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <bmkdeyquoyvcwcgucijcxmgnip32fs4gyqe6gvponokwiu55cf@7ncsbggx23ar>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDA4MCBTYWx0ZWRfX2nntS18qM1Hg
 g0Wc/xqK+qxiGtq8h8gwwwJNvZnZxJ/SjihNTXUek2bai6ci3huNIisxsYuJPUgyePRacNo0lFb
 VB4GJpX0LvHMnp9/r2mq+uuhB2t8ufXtp+kq0fb1TjQCypE799dyu1yboXjsEZS/qZiWqBi8C6l
 I4xwyq4bLQr/3c1PxRZ1OPC/OuA8Kfe6puRN8mUBzDoas7+zMZRDszdqh7vT1/xHsXTJ7nfN9eO
 6FYpXPK6PRpLDS34nqVMcOLu5gjQPfmZezSQ7DbdWur5IgWVsR1aa3hOYcvvB6wYMnJ1T6za5Ty
 ipfGqoXCY4dLpqi0SnJIoztjV/nxaArWc7NO//yTNuTASijBvV3FcVJFS3mkZwwbbBC0zVCk1VX
 7wsBNQhi180EKuk7M1anh7I1BbxlnZBkkAcsKv0D8COAzb8LhrrdNpcljfCdM+6DnuxchkH5oPw
 iC59VbHGVnLTz8yFbJQ==
X-Authority-Analysis: v=2.4 cv=aueCzyZV c=1 sm=1 tr=0 ts=6a100edf cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=SOlSXIn2j7jxmtBtDG8A:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: CTaF6tgVzuySEXA3qCs-k7JpEn6g0kMF
X-Proofpoint-ORIG-GUID: CTaF6tgVzuySEXA3qCs-k7JpEn6g0kMF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605220080
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org,quicinc.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-109197-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[patchwork.freedesktop.org:url,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 213F35B059F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/12/2026 8:34 AM, Dmitry Baryshkov wrote:
> On Fri, Apr 10, 2026 at 05:33:35PM +0800, Yongxing Mou wrote:
>> Add support for Multi-stream transport for MSM chipsets that allow
>> a single instance of DP controller to send multiple streams.
>>
>> This series has been validated on sa8775p ride platform using multiple
>> MST dongles and also daisy chain method on both DP0 and DP1 upto 1080P.
>>
>> With 4x4K monitors, due to lack of layer mixers that combination will not
>> work but this can be supported as well after some rework on the DPU side.
>>
>> In addition, SST was re-validated with all these changes to ensure there
>> were no regressions.
>>
>> This patch series was made on top of:
>>
>> [1] : https://patchwork.freedesktop.org/series/151522/ (v5 to fix up HPD)
>>
>> Overall, the patch series has been organized in the following way:
>>
>> 1) First set are a couple of fixes made while debugging MST but applicable
>> to SST as well so go ahead of everything else
>> 2) Prepare the DP driver to get ready to handle multiple streams. This is the bulk
>> of the work as current DP driver design had to be adjusted to make this happen.
>> 3) Finally, new files to handle MST related operations
> 
> General suggestion. Please reorg the series into the more logical
> chunks. If you are touching enable / disable path, then continue doing
> that until its done (more or less). I'd really like to be able to merge
> at least a part of the series in the next cycle, but there needs to be a
> logical "halfway done" moment. Let's define it at the "all paths are
> refactored, all booleans are in place, we are ready to get MST parts".
> 
> I've not found a use for separate bridges in the MST path. Please split
> the functionality between the MST connector and, maybe, another private
> object for generic state (like connector -> encoder mapping). Other
> drivers don't have this issue because they have fixed CRTC -> encoder
> mapping. MSM doesn't so we need a separate way to store that. It's sad
> that we can't subclass MST topology manager (or its state). Maybe it
> would be worth changing that and letting our topology manager handle the
> assignment in it.
> 
> Also, I found a set of warnings while trying to build the code. Please
> make sure that there are no warnings.
> 
Got it, thanks...
Does this mean I can send a subset first (rebase on latest linux-next 
and ), for example the first twelve patches? They are mainly clean-up 
changes and do not touch the MST part yet.
>> Note:
>> Validation for this series has so far been done on the latest linux-next
>> on LeMans, covering both FB console and Weston.
> 
> It wasn't. I couldn't apply it to the latest linux-next. There were
> fuzz-based rejections because of one of the patches merged some time
> ago.
> 
Will rebase it.>>
>> Broader validation, including additional Type-C DP use cases, is still
>> in progress and may lead to some follow-up adjustments in the next
>> revision. I wanted to post the current version first to collect early
>> feedback on the overall approach.
> 
> It's nice, but please keep in mind that majority of users use Type-C
> rather than native DP connectors. In some cases your lack of Type-C
> testing affects the design (e.g. for the HPD handling).
> 
>>
>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> 


