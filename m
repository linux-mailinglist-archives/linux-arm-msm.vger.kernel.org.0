Return-Path: <linux-arm-msm+bounces-98310-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OCKCI78Oumn+QwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98310-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 03:32:31 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E6FBD2B535A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 03:32:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 87670304B583
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 02:32:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C17E1C3BF7;
	Wed, 18 Mar 2026 02:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LTt6cFAQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Bl8yO27H"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAF9C23DEB6
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 02:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773801149; cv=none; b=WGts2kbNpNVJt4M8SBElsr6/JHc4cqTbGUBSF9mxtdykukcXzKI74Y48BgWaM+P54LKOCTIPC9xbCyQUAPi8PR/OlroqmeW/e0vQ98LyRoqO0fS1maSkaFMlbYSfKQc9hhcdgVD5CsXGrsuyJJgPaqn1Y0MRBr4HTpPH7H7oBg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773801149; c=relaxed/simple;
	bh=lxAhaEWs2+FmdG3YfbK8rEImBbT05jrDevjZ7VkfczY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jjY0tpDFgh5t/f9yRXq/kbGFoxfIzgnbIjLNscdax0h++IEoPBjUyn77rbQ9qAsXDjjONb+kN8WXLyjc/5Bkbsekz5JBcjkIHVD4DWhcvY2twukzO95X3F0PT2Fs6vX8/pBv8l36PGQGD5Io105Rmfr5XIlWqW8/p3u53ub8ho4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LTt6cFAQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Bl8yO27H; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62HIKKjs2296076
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 02:32:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Yyq/oFXi4JPQu7LG9ZwWWGPlqaxWoh2Asw+MKRbmFns=; b=LTt6cFAQ875Urp3Z
	nQ+tzlJ3ggMqhvXBJGapEdIVmwXMp5a4rMiD/rjQLkYmfIWNzCZPjy7I5nUs7BiW
	ITRQidVx+2wr8Ui4cOik2qKGwDPuoMm01UXNJt3JASZ9w10TwjJiR5ZlQWgmZro7
	t8q+xOzrR2Sc0nCYEiWDLYXm0viV55aCQiyGF7vfDMKr9mTPbfNJc5Z0HrGrtRWU
	qx2xg2UZ2pIaBHAV/lwiem+Xr8l+fX3QWfIEhdSGOzSfLR8W2GB98GrCX1dIBFxU
	R2fmEINZGnjJITD7UuSX10Eu7Wq9qXKfnX3jdhwMUhcYreap+JYkWBGIfCLM8q0t
	8+OFIw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cya83t0p3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 02:32:27 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-354bc535546so6704876a91.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 19:32:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773801146; x=1774405946; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Yyq/oFXi4JPQu7LG9ZwWWGPlqaxWoh2Asw+MKRbmFns=;
        b=Bl8yO27HyJ48Z3ZubiFbe69t3ai8ja86ko8rd1cbl42919TT7Y8BvczqCaBlq509Lv
         P1scyUZdbe5qrJCaOuxmQL0P7WAcguqoudlwcjmtuNLpyDGdHwDyA5GIO/VKfdG33NbP
         Xm8IdfNhfgNw7EvkAN4aTagspMZXuyInufe1joiu+/RPv20pihg38M2VSsQ5d+fiVFBi
         ozc2ZC3aNWcJ0eV6jpbhx7OKo625V1cS64lQoOFruWcq/PVPsqzeHs/6p8E0v7gXe2eb
         ssI4x4ks2B/ASZ9cnDsihPz13VPtz8BJStJC9gbeZgWNROd+5KyqnbZGvqc16OEX0Vy2
         u68A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773801146; x=1774405946;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yyq/oFXi4JPQu7LG9ZwWWGPlqaxWoh2Asw+MKRbmFns=;
        b=BKM7K89IUe1oXNH4DMMkl/9eDgzFU1QmGrI1yP9nlsBQZmTV715tn/kLnbqPq03G0w
         s3vYfmSaMixkuHBH5YtmTVQrr7mdKD6HQe9OiwMTIJ2iEKTS9cmZ7lqDg7zlPEbRqcMP
         ZRq5iZRUfz8mq9hhijjKYSV/bplnB/tH5BkiCDt+s6Bv7RHezNWp9DbmPvp4wWYj65Vk
         tIfeOa/2QMpJmxSO7NybNY0iSuZvVgBATWGKqe4OP8ByQai7YzXj+9/dhsd8SdgIfD8f
         Xh74zB1joSnWeYOIRhiTgYAzgMjOUY5uzh3aLhpnmB5MO9TiLdKGHVYClKblKbUU/fVx
         /Qew==
X-Forwarded-Encrypted: i=1; AJvYcCWzDGUYP4VO8bxqKjt5H/k4GqR/GPJhVTxQ5ahocsqYWsXvmIftcegrdss7lDE/Dxy7xJntx80GMi79nyKs@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9ClnnAfyNBm1PIHLAe5Ek1EiyxYQrwjYrx3N+NkqICIvIW3pf
	zI+X046zpvU+6DwaxwpO8W7SqqkYvP6qJ2QnmvqjaM0PA9LS4krIs8nSVauMGKbUpm2peB7s7a1
	IHH6vXvhz8g8DqpDxQbxveuqzZfkjOl9dMN0UvGjzebRajim8XnlR0bVLqzT3vYVkUcaw
X-Gm-Gg: ATEYQzwti44UQIp9jRQqO73hs5L/vWC7VuPfeOLutLtgM+ozMVnH3DcwZ1tBcMZ9pPt
	u8NCLP874qe/+Y/jf3u1ru+zS5Qd9Rxy5u+NcbQqKIZV9d+5hin5sLGhqi3XK3qgQMyYpm5kwY1
	dG52khB0aexsAUWaqNRiCrfhXsTN6iQILgHkGs583sLbC3f9G4A5UoNvY5dDBtGP0c9y5JZymJ2
	KdtYRgzSHqn3ZvHy+8o33uHS/yxX3RIdu16VTPzU+BYFmxEjg7HFG8CKrRM+j7Wd+/Rw731p0jl
	dQKIdpCQPmp7TGMpO66sp5+il1aGNlZMKv9fsD6MXlKKCMGA9TVLEsO/oJEWO4JdQpe+kxxhcH/
	Y8km18BwA4kqpgqx7iJidgKel36keziafV9seb32NvlVW2T/7
X-Received: by 2002:a17:90b:50cb:b0:352:ccae:fe62 with SMTP id 98e67ed59e1d1-35bb9e5d7c1mr1333352a91.10.1773801146266;
        Tue, 17 Mar 2026 19:32:26 -0700 (PDT)
X-Received: by 2002:a17:90b:50cb:b0:352:ccae:fe62 with SMTP id 98e67ed59e1d1-35bb9e5d7c1mr1333326a91.10.1773801145730;
        Tue, 17 Mar 2026 19:32:25 -0700 (PDT)
Received: from [10.239.97.158] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35bba2175dfsm838821a91.0.2026.03.17.19.32.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Mar 2026 19:32:25 -0700 (PDT)
Message-ID: <4f0c351a-4268-4cbd-92dc-a5cc9845fb85@oss.qualcomm.com>
Date: Wed, 18 Mar 2026 10:32:20 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] Bluetooth: btusb: Allow firmware re-download when
 version matches
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, cheng.jiang@oss.qualcomm.com,
        quic_chezhou@quicinc.com, wei.deng@oss.qualcomm.com,
        jinwang.li@oss.qualcomm.com, mengshi.wu@oss.qualcomm.com
References: <20260108074353.1027877-1-shuai.zhang@oss.qualcomm.com>
 <zcn4iagkp4wtcg24obdhlv6pj6xyakcbezuzz6so3nvwneuybo@5bg3qjsuajqd>
Content-Language: en-US
From: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
In-Reply-To: <zcn4iagkp4wtcg24obdhlv6pj6xyakcbezuzz6so3nvwneuybo@5bg3qjsuajqd>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: hKT4Q_liSPTHgGScGG44N3O8siJBFgx3
X-Proofpoint-GUID: hKT4Q_liSPTHgGScGG44N3O8siJBFgx3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDAyMCBTYWx0ZWRfXwzCKsCkOtTf4
 0YvSCOiZ/Vl2Y2Fx6ECEC9XXMgaaruPfdDFCEsvSDiVTBmiRfy02ZEtxZN5oeLB+sU01aXM0BHQ
 R6RRYBeka9dXZguF4j7aS7h0x1Fir4Z6gSxn/XvAd3ZVBJVg52ZAyG4gxm4DP8OiYXKSjhROL3t
 d/E5hoqqxmld1zQjGUfXLZKSN1Hak3GOvR8fC2TvVaxm7UOD9gL3gSxYvZmFL1F8zqmrqVJLJvM
 IgP/2HJ3I3Cgx9H1XceJTfwgua11VABj+1xdSjMgR2CSC7lZCw+gdej7XykoPUVw8LPvR4KGDjq
 UgTC+BT5srF0zJbpE/nhfZXJJKunXUq3RvxJYbqUpqWvGumnbD5vIgh4TcLxJNsABoyXcESQIXB
 hbEjDbHIBejgEK+zr/rznj/F4E9aDbwEyMpPvylx4Ww5jfeGIHBhT2QewsNtSDWXdg59jV7NP+w
 gysJdS/hzf60RrOeAjw==
X-Authority-Analysis: v=2.4 cv=Y8n1cxeN c=1 sm=1 tr=0 ts=69ba0ebb cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=_LWKTQWFkmdMk6si93kA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_05,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 impostorscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603180020
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[holtmann.org,gmail.com,vger.kernel.org,oss.qualcomm.com,quicinc.com];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-98310-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shuai.zhang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E6FBD2B535A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Dmitry

Thanks for the review.

On 3/14/2026 12:06 AM, Dmitry Baryshkov wrote:
> On Thu, Jan 08, 2026 at 03:43:53PM +0800, Shuai Zhang wrote:
>> Since USB can disconnect at any time, if it disconnects during
>> the BT firmware download, the BT controller firmware version may still
>> be updated even without completing the download.
> Does it not have any check for not completing firmware update if the
> download was not successful / complete?

Because of RAM limitations, the controller updates the firmware version 
during

the download process,even if the download does not complete.

Since btusb cannot power-cycle the controller, the only recovery after

an interrupted download is to retry the firmware download.

>
>> When USB reconnects, the BT host detects the same version as in the
>> firmware file, which prevents the firmware from being downloaded again.
>>
>> Therefore, remove the equality check to ensure that after
>> USB reconnection, the BT host can still download the firmware.
>>
>> Signed-off-by: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
>> ---
>>   drivers/bluetooth/btusb.c | 5 ++++-
>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
>> index 646de80c7..991064a25 100644
>> --- a/drivers/bluetooth/btusb.c
>> +++ b/drivers/bluetooth/btusb.c
>> @@ -3503,7 +3503,10 @@ static int btusb_setup_qca_load_rampatch(struct hci_dev *hdev,
>>   		    "firmware rome 0x%x build 0x%x",
>>   		    rver_rom, rver_patch, ver_rom, ver_patch);
>>   
>> -	if (rver_rom != ver_rom || rver_patch <= ver_patch) {
>> +	/* Allow rampatch if version is greater than or equal to firmware version.
>> +	 * Equal versions are acceptable for re-flashing or recovery scenarios.
>> +	 */
>> +	if (rver_rom != ver_rom || rver_patch < ver_patch) {
>>   		bt_dev_err(hdev, "rampatch file version did not match with firmware");
>>   		err = -EINVAL;
>>   		goto done;
>> -- 
>> 2.34.1
>>
Thanks,
Shuai




