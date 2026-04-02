Return-Path: <linux-arm-msm+bounces-101406-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 11hdJb/TzWmWiAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101406-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 04:26:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A5A0382A4F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 04:26:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 74A5330333DE
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Apr 2026 02:26:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80C602566D3;
	Thu,  2 Apr 2026 02:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lKvz3NRj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SkgBFstD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D30D6FC3
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Apr 2026 02:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775096764; cv=none; b=n5LxmsdYHfkHV8aevPDzYG7xlDHJBkbpLeKpJ5YsWEJPdcgmjGUq4zkEzKuJHK24e3balRPSIOOwYbsJ0nWw8T184yeSOO3VRcNwmQC4R/aTifEfqlMMGPZ9zUwGRFYEomGQ8g9iPTJJ4FaNSxKiqoyFkfqXFqfA3wr3LSLIV/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775096764; c=relaxed/simple;
	bh=+hdin/cabmUnkeHYjAQY+h3l/3itYJtI+V7QeMIgFB4=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=LYRrwRTMDluZ/H+VeJW/3EKn6z5IcydxfWw7KCd8kvbnRRX5GHnQ5PuzARDwNVJYF1eX7Os0gsexMYpjoPhrmDb4B62wqCTN+JEbx+99SpAnwmN0UGfWRspSWf9eppkKYDW/EK9AZeRtGOtNrPCv2jNwwMwO5IxYW+x8nW1JqWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lKvz3NRj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SkgBFstD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 631M3uIm1424160
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Apr 2026 02:26:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YoETeGfnx+ul1+cJim1t3718pgueffgoi0/3qr5B0f0=; b=lKvz3NRjg/wwN+ja
	SnR04LOM5HUkSFyYAkyyiQhkVdNaU+j0X+wDeH/p4AzZhlkTi3tfBJ3X8IfRNuN6
	MarWuJjXT5sBidS367kxwxNe7hP0i6JKJr9HSKEG0SHBvf0ZprmKfGgQJVGGkDqG
	NCGJ3ly6HopmWx6s/ymMOHrXyFC/7HgSVJKp+BS4rv4ldHeDxWbS4lTeoC3KpM+P
	uIZ+ldj4kcv5pgxCvccXqms8IYnP4mLPXHqlUT6y7+3f5A3Y7slufIIF/P72mEyK
	3+g27DPqRP49FJ73PEcnfBjIyC9D+bWVY2p9DGZWVfsZcba5ICjlgnYqoy1kV/mn
	hKnmhg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9511afct-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Apr 2026 02:26:02 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b241be0126so11482445ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 19:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775096761; x=1775701561; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YoETeGfnx+ul1+cJim1t3718pgueffgoi0/3qr5B0f0=;
        b=SkgBFstDEmAh/g/EMWfgYK3NHeYbTImbigC55ongYiNwVA/a3ubjRf6prYIAYqhRWm
         ku1K0UF+64uuDs+xqW8O6GPjJ/2yvb8YzqVSyOfA8NQCXeF6QNsoDGYOVlFlLqmbYAWn
         EQlYkRZMGUzYLoP7QL78EEaai19ZnJcaZDpXjd37NDvg4HPZbpbEl1H4qaDafq02BEFQ
         ZeBWBqk6Gqxs+qkSHi+xkQmmHbeA5KmHcF52DzdalH38SMr0KI614lZ+2TEUryEh0NR7
         7PCKhP1iC0Ot2IXWvWKAu+QL0D+O2usPVZGLrgODxc+jhA/p/isXsu1o8AXNo5uexGIb
         KdBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775096761; x=1775701561;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YoETeGfnx+ul1+cJim1t3718pgueffgoi0/3qr5B0f0=;
        b=bma8yd01bhZg1nSnEIHRNiMUXYLj0TUDcEczsKb6iU9TkGhXsTLMnvTgqxw8WcZAnU
         xsPQYjG+PUBdBFAYFbER3KUg90BuyAzGprvBSiBE//7nCh1c2uRY2U2FBMQM3ib842rY
         SPotzYfGfY74PwR9GKaQmPVjAJRUqp329Mvq0jqU8vE4DUXLUFeUl/tDPKdhTx9n4mpq
         ke14SrGS1sYhlReDVC9lb8cVtcitRm2EiRv46cGuPoe/GZrLtPPRdn3P9Az5LEH7Inmt
         tbl2AZrcjSHYXjlr1VJ4rFl3S/MX/YdU3ulalLEr3aWT3CkAJbrMqIDNCFcS814PBxGl
         /j4w==
X-Forwarded-Encrypted: i=1; AJvYcCUcaOC4sMRcjm674/ILP7TA9QifBFSn9PcHNHj4aBm3LH6tmBcPkN2OpALf0TJ2sK7t4IiO+m+zseSy4eow@vger.kernel.org
X-Gm-Message-State: AOJu0Yxh7Gt9j2VieGITjFgoPbs2jrWpSbeW8+fHEZkzbLc4kXeKDu5U
	916QrHyBnTZIJlN++PpWjP1/8beMhUERgDNFEcmYtnkN5dn0tk4/gY+WYp44kpQbvDXC+nOZJMX
	OVCYlVsHHGl35AXTsXS7OGzDrZMZlnNVXwM78BgdaPudRLvbzZ4GMYwom1z//DeOjlbzm
X-Gm-Gg: ATEYQzz29ceMpADMb4u3A8hzmDyCV7LhbPikvDP7MZCpCZHN2Y0i+D37Kk6dw6llXEA
	hfh36n7WT9uHbp0muCEwpReEAzyL97TU9VWQx13D05+ldRJhxrXHTm3ivubDBy3QBqyax5SomRO
	MyFUZ89djBGZD5WOe+DuXAgWpWplY+9A7JnTBxCY1vK6eZGUjYczSp3j9gC1ANEwuAQs1Jclf8V
	OtAf6Cf77ajJbMA4mUsjtl4/lgbhDvUUvA/rjisfupG0lgE7ROMyMbQhl7syI8hNbKlXQlWQrNJ
	CmiKM5iwyYBvU61mgj32CwUoEhnaEcK9SekUZKpBfHkGSC3Uxes2iahMjBW+WD6dlhrT+kxAsPX
	83ELWiXNvDXOU6Tg5NXMHrfQRVTNq8AfMSF1LaZ5P3YAfwZ21
X-Received: by 2002:a17:903:458d:b0:2b0:5923:5194 with SMTP id d9443c01a7336-2b269d000a0mr51326685ad.27.1775096760991;
        Wed, 01 Apr 2026 19:26:00 -0700 (PDT)
X-Received: by 2002:a17:903:458d:b0:2b0:5923:5194 with SMTP id d9443c01a7336-2b269d000a0mr51326315ad.27.1775096760454;
        Wed, 01 Apr 2026 19:26:00 -0700 (PDT)
Received: from [10.239.97.158] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2749cbd85sm10116345ad.74.2026.04.01.19.25.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2026 19:25:59 -0700 (PDT)
Message-ID: <e6753ccc-ed47-4543-8447-b616b8a42be4@oss.qualcomm.com>
Date: Thu, 2 Apr 2026 10:25:53 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] Bluetooth: btusb: Allow firmware re-download when
 version matches
From: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, cheng.jiang@oss.qualcomm.com,
        quic_chezhou@quicinc.com, wei.deng@oss.qualcomm.com,
        jinwang.li@oss.qualcomm.com, mengshi.wu@oss.qualcomm.com
References: <20260108074353.1027877-1-shuai.zhang@oss.qualcomm.com>
 <zcn4iagkp4wtcg24obdhlv6pj6xyakcbezuzz6so3nvwneuybo@5bg3qjsuajqd>
 <4f0c351a-4268-4cbd-92dc-a5cc9845fb85@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <4f0c351a-4268-4cbd-92dc-a5cc9845fb85@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDAyMSBTYWx0ZWRfX+KcQ4Ik16kHN
 jR93bU0B2CED+PhoLO6U6yN0Nr+7mP605/Xien9S8exqQ/bAjln+pSiuM8sba2J9iIl9Ym3tQjM
 l1yhEdWFCIlmPxL3TAk2eVcp9psrWzk8cx3hViDIsd8a0MsKp4c9ADwMy9NWX8iaxxH+KAA36vV
 FJJio4Squ4S4J0rWSrMwiqFQsldHo3yxVHJ2Yh6TDYSgRpQ7RLHevE4cQQebTIzyZF3dEQG0j54
 soWXiNqqlqtvHtdljYMT6n89N4ZfIIJGRHkiUdTwYf6oG6HXHvuWW4mQqjgOw/VCbEyfIL9L+1c
 QICIIolkRlGtOjSGaCVG14TyLZJ7JLGFCdd3HEJ4uVzKvQuy/BiXkpcTVIwP/D8+kTNQaQ48GFf
 teC0zPSYSi6SMdnnPdlNwWzmuREaDEVFI1hXTn+977V12t7L7EmI/gAF787l/NQZa2IO1cOvUKs
 s08hsQzWPwkVHe9yLPg==
X-Proofpoint-GUID: 3KUpt5TKJp9GO1WrgT75oMgr5ke7LzYx
X-Proofpoint-ORIG-GUID: 3KUpt5TKJp9GO1WrgT75oMgr5ke7LzYx
X-Authority-Analysis: v=2.4 cv=F8pat6hN c=1 sm=1 tr=0 ts=69cdd3ba cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=F5nhctsNCyJB_H0xsZgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_05,2026-04-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 bulkscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 suspectscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604020021
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[holtmann.org,gmail.com,vger.kernel.org,oss.qualcomm.com,quicinc.com];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-101406-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shuai.zhang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0A5A0382A4F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi  Dmitry

just checking if there are any updates on this patch.
Please let me know if any further information is needed.

On 3/18/2026 10:32 AM, Shuai Zhang wrote:
> Hi Dmitry
>
> Thanks for the review.
>
> On 3/14/2026 12:06 AM, Dmitry Baryshkov wrote:
>> On Thu, Jan 08, 2026 at 03:43:53PM +0800, Shuai Zhang wrote:
>>> Since USB can disconnect at any time, if it disconnects during
>>> the BT firmware download, the BT controller firmware version may still
>>> be updated even without completing the download.
>> Does it not have any check for not completing firmware update if the
>> download was not successful / complete?
>
> Because of RAM limitations, the controller updates the firmware 
> version during
>
> the download process,even if the download does not complete.
>
> Since btusb cannot power-cycle the controller, the only recovery after
>
> an interrupted download is to retry the firmware download.
>
>>
>>> When USB reconnects, the BT host detects the same version as in the
>>> firmware file, which prevents the firmware from being downloaded again.
>>>
>>> Therefore, remove the equality check to ensure that after
>>> USB reconnection, the BT host can still download the firmware.
>>>
>>> Signed-off-by: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
>>> ---
>>>   drivers/bluetooth/btusb.c | 5 ++++-
>>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
>>> index 646de80c7..991064a25 100644
>>> --- a/drivers/bluetooth/btusb.c
>>> +++ b/drivers/bluetooth/btusb.c
>>> @@ -3503,7 +3503,10 @@ static int 
>>> btusb_setup_qca_load_rampatch(struct hci_dev *hdev,
>>>               "firmware rome 0x%x build 0x%x",
>>>               rver_rom, rver_patch, ver_rom, ver_patch);
>>>   -    if (rver_rom != ver_rom || rver_patch <= ver_patch) {
>>> +    /* Allow rampatch if version is greater than or equal to 
>>> firmware version.
>>> +     * Equal versions are acceptable for re-flashing or recovery 
>>> scenarios.
>>> +     */
>>> +    if (rver_rom != ver_rom || rver_patch < ver_patch) {
>>>           bt_dev_err(hdev, "rampatch file version did not match with 
>>> firmware");
>>>           err = -EINVAL;
>>>           goto done;
>>> -- 
>>> 2.34.1
>>>
> Thanks,
> Shuai
>
>
>

