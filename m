Return-Path: <linux-arm-msm+bounces-114165-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7y/NMG1kOmpo7wcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114165-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 12:48:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EF746B65F0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 12:48:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=gv4VSbVm;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=fh1a215M;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114165-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114165-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 01AF5301C10D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 10:48:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05504368264;
	Tue, 23 Jun 2026 10:48:10 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C277B27AC57
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 10:48:08 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782211689; cv=none; b=GIRUkwBLUykjFn2N0aL6FKw4hkZtf2tbVG5aU3a1zBekObClLyAuz9qXubfmRAO90yoQM36Hsrt9Pkm1AP/Hp8n09oP6cn159uhgQ8x+DT9mYlrTHNJ6Fr2QZFkGSj7KfahBmlWDJz01b3TCYSDcsMmZLSW7vs0VGiL+1UFmIhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782211689; c=relaxed/simple;
	bh=xnN/8QvLP1X1MElPCkZ3aT/2ZO7xrDZDOTBoqCPC+i0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MIpfnxH+JQ55cd1pIzzQVZmXoHpdbAvIx/PgQDMzQOxntRVAzn3lKQ4vcduGg8WcTPPm6LalPsUQxxR48PlSXi85Ipi3Im1vi63rB6Cqj6kQGCFqr69GSB4MVCiXMzcsaN1/AK0CPArqpGCS1YJCWrqHJZFhBFefPEQUHQhVO08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gv4VSbVm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fh1a215M; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65N7jOiE1778429
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 10:48:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yfHADPd3YbiMqVZVRTQ1yGUj997dVMkKh6uX5LLNvXg=; b=gv4VSbVmzNDFWkv6
	H/dTQVYHNbaH7RvBatgF1nK8W5YuN486esIJWfXFWZ9sWx+Gw35rv+l8YFNEQRz6
	gWpnmpmmmYUzq/xY5vODecFvdVHRMt7uPhSW3aIoWmhn6gPWg0vdNT0LnWY0gVDf
	/0GJME8xeG2XWf8XtRx2H8IwNxnwR7OUD3u9+TRJV3OF8kiojxQTza9ZTtP3+tWh
	5ca49x78i07Et1irFhXQ87zmp1CAgaed+ZW4DwP5KsK+W4Dj7gh5k9SiTwxRG9oL
	syBRCA3Ex72U7Wgw7HyZhJokwes1OGmYWwlRqWMtRsr3qQmHQc8p490jbjLAJf6S
	5NK1OA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eyp1grrb3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 10:48:08 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-36b862b27cfso777565a91.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 03:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782211687; x=1782816487; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yfHADPd3YbiMqVZVRTQ1yGUj997dVMkKh6uX5LLNvXg=;
        b=fh1a215MWT7RBItuf5QKl2AMpraXlpFfEGyyAZXM27I3E9os+kGSCHxbxHB+R52pfX
         eil2HlE+KlloFvs9HO6ptR1NoTGbf4allSWKh+1AB5HVnC3HwFrg12NPdjWVPq8CnBsI
         KXzk8igdkfq0SVf9Ch9xRUQQu64fnvFYxHMrxIWJOjyqrDY/KIOUrHdKk0V/Qtbk5hB9
         RU5i1ZaZ2oTXTBBaGtYdkzI0ePem5vIHBcaC/nQSam3xjaBLuayAu6QKSdCuDuyyBINq
         4vh7IwCFTg4WTyxzX5T3hpbeIE1WNBSt/4GVD/WbJgDjm3Ex28rUG08OyYgBzwkZzHMh
         j74w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782211687; x=1782816487;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yfHADPd3YbiMqVZVRTQ1yGUj997dVMkKh6uX5LLNvXg=;
        b=ElqAfhWgrDsBtVaPP4ZhQrapc/BiwKRydCqdVOpMg62GVvi1gkIEwnsH50+SDhDRE8
         8FYlVq2z+6L5DwhNIJdU6P7e8zZI56LEuwKZx1lmK7MKNpgvQ3qsyaHc8EEa4VMVMdKB
         yjuBlw4siU+olbeiACmQ3QV+9Qf45n879gdjnENU6X/BmLi5sVmwEURSVbGzfEpsKnxF
         w6dyKe0o3ROZLC995ACxMoSltSkdSa0mVQJny3Rdpip9XD08LV1pC67lLlVFOxNe5WdY
         wmBH+Z6M5PXtnPIYqcGVnIEFacw5yf1mvPl/PYEBLt2nigamvEEmQvdmHB8rAmibeWGk
         JllQ==
X-Forwarded-Encrypted: i=1; AHgh+RqOJWWW+5eKpH0uR1vbCAmMVuPEq9fflSFgAHAYc6CxYXgf9CiBxLZOKfnJX7YlmpmJkp7OdbRKtD50wTs9@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/eMiUx74j/DHiX8BEtQFyHgejdl0ybltfPb8crtZKJzHdEvXf
	wI6DioIUpcC0l24sY0Qi8Wem0TWQTZnaL25nPEI63luWxDAGbn9rwnDm9lIg5/hBwITGsRVAOq/
	Swg6Cxt5kgZ99KbG3narn57ELTHM9EBPbnrksrj8E6XFK0Szn+kaQpphSM7jZpZcyzdL5
X-Gm-Gg: AfdE7cln/k1CRDBkMxuYzPTGfratgnk27EF9j39dYoCmUyqxHChhJUXnBsCTjEasa51
	hflutON/y5KBDv8MK+F1+E+NHJauhK5l8ZtEq+M/+ZpVbskZG8Y4ZGiQjQ9sDK9rpp2sZDghR1w
	PoBkajhkT6y3v6SVQdTDD/cifajWi4UP+9DSvYmtB2858WxTn8pXjMPaA7HGpo3kk0dUkQ4mzs8
	Qmn0w67c/pnrxIKzHidyzSsN2suunCKLH7RA7QpAiqnhkFT2DbQOJeJ8VU9b4VCAEdtzd2pvfSY
	D7+dZqSsXB1iuTzpsN+vurPsFGOubZnbqlWQHXrYjHL9iq55QL84jrx1DteFalpNGDJ/LAi8kmM
	18P3DxKalCMSl3dROkzu701sg1bqFyUxHpbm7Dm7doJmDiv5RAgyZcvNtIYdSHznAaTlxMmQMCt
	Txsw==
X-Received: by 2002:a17:902:c946:b0:2c0:ccdb:e027 with SMTP id d9443c01a7336-2c7bf1ea3e0mr23824435ad.5.1782211687428;
        Tue, 23 Jun 2026 03:48:07 -0700 (PDT)
X-Received: by 2002:a17:902:c946:b0:2c0:ccdb:e027 with SMTP id d9443c01a7336-2c7bf1ea3e0mr23824235ad.5.1782211686935;
        Tue, 23 Jun 2026 03:48:06 -0700 (PDT)
Received: from [10.133.33.161] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7436f6395sm107070095ad.28.2026.06.23.03.48.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2026 03:48:06 -0700 (PDT)
Message-ID: <4d764907-a3b6-4fd1-8954-8f9b8779c31a@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 18:48:02 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/13] Bluetooth: hci_sync: Fix return value of
 hci_reset_sync()
To: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: Marcel Holtmann <marcel@holtmann.org>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Ben Young Tae Kim <ytkim@qca.qualcomm.com>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Matthias Kaehlcke <mka@chromium.org>, Zijun Hu <zijun_hu@icloud.com>,
        linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
        Luiz Augusto von Dentz <luiz.von.dentz@intel.com>,
        linux-arm-msm@vger.kernel.org
References: <20260622-bt_bugfix-v1-0-11f936d84e72@oss.qualcomm.com>
 <20260622-bt_bugfix-v1-8-11f936d84e72@oss.qualcomm.com>
 <CABBYNZ+z6XcZXejs18fbX-MSFBmaGC0Reoqn549N-8sn==z2Ug@mail.gmail.com>
Content-Language: en-US
From: Zijun Hu <zijun.hu@oss.qualcomm.com>
In-Reply-To: <CABBYNZ+z6XcZXejs18fbX-MSFBmaGC0Reoqn549N-8sn==z2Ug@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: fJoqbiEWQg1rUxwnD-sYwuesEUEViBbP
X-Proofpoint-GUID: fJoqbiEWQg1rUxwnD-sYwuesEUEViBbP
X-Authority-Analysis: v=2.4 cv=QJhYgALL c=1 sm=1 tr=0 ts=6a3a6468 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=gI2jydi3O7-V3eHH3HoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA4OCBTYWx0ZWRfX+7MwzO0qW7Dd
 UooJsKruXt0NfkaFuZRCS4GyEJo529mx9swTNf78jCw5kxE81DUGrkbduFdtkvcg6GW6+dgTjLp
 Oyx6q2jS07wdbqh2wqrlAknmLT/g5mI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA4OCBTYWx0ZWRfX0qpLoaZf4s0D
 Zrv5m/acEt/1T3h0vLHQrMcxERPochcQf387yMIyw9HGayRkkBvMQnGpSvFjCNcU1K41JDsn3zS
 ppqcDOWoG1TFSMjxpvk14mwhucX1Nuz7Z2mZgrN4HJckwK/OL1ZIx5JGUqQ/Blr66BBd2tvZ3k8
 kUmoX07EAt98JMTXXmWTSDZf+dKvzLPCRJSh/TbyyBcE5tELMwJZQkaVTxm3qKAbUL3sTwGtrGG
 trUGSIWUh8+gfXn0vJHiWPcC2IonIy0Gigo96meSFmMNjNaYBri9Gw/ES6lOkvrV72Sr7iCEkTn
 Dt1PQx79AIRnlCtXgkTU9JqJ1CgI+v6TTKQCyiIIiRrp0effZu9FMshquiWGw6CVXif2VveQVJj
 r9w7/PY/EMn3b7iBSlQ7mRz/mY6mdxXI2q8mae5Ax/CR5D/3/flqHfU4NBXlHVmqk9mdNd34Jqc
 krXN2DuAZpSAameHxGw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_02,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 bulkscore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606230088
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114165-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:luiz.dentz@gmail.com,m:marcel@holtmann.org,m:quic_rjliao@quicinc.com,m:brgl@kernel.org,m:ytkim@qca.qualcomm.com,m:quic_bgodavar@quicinc.com,m:mka@chromium.org,m:zijun_hu@icloud.com,m:linux-bluetooth@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:luiz.von.dentz@intel.com,m:linux-arm-msm@vger.kernel.org,m:luizdentz@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[zijun.hu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_CC(0.00)[holtmann.org,quicinc.com,kernel.org,qca.qualcomm.com,chromium.org,icloud.com,vger.kernel.org,intel.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zijun.hu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1EF746B65F0

On 6/22/2026 11:35 PM, Luiz Augusto von Dentz wrote:
>> diff --git a/net/bluetooth/hci_sync.c b/net/bluetooth/hci_sync.c
>> index fce9f9526cb5..601d44ef975f 100644
>> --- a/net/bluetooth/hci_sync.c
>> +++ b/net/bluetooth/hci_sync.c
>> @@ -3678,8 +3678,10 @@ int hci_reset_sync(struct hci_dev *hdev)
>>
>>         err = __hci_cmd_sync_status(hdev, HCI_OP_RESET, 0, NULL,
>>                                     HCI_CMD_TIMEOUT);
>> +       if (err < 0)
>> +               return err;
>>
>> -       return err;
>> +       return -bt_to_errno(err);
>>  }
> There seem to be 2 consecutive changes to hci_reset_sync that conflict
> with each other, also the expectation should be that positive errors
> are HCI errors and negative errors are stack generated ones, so the
> callers should really check `err` and not `err < 0`.

  Hi Luiz,

  Checking the full call chains:

  - hci_reset_sync() → hci_init0_sync() [if (err)] → hci_unconf_init_sync() [if (err < 0)]
  - hci_reset_sync() → hci_init1_sync() [if (err)] → hci_init_sync() [if (err < 0)]

  A positive HCI status from hci_reset_sync() propagates through
  hci_init0_sync()/hci_init1_sync() but is then silently ignored by
  hci_unconf_init_sync()/hci_init_sync() due to their if (err < 0)
  checks.

  Will not change hci_reset_sync(). Any suggestion on how to fix it?


