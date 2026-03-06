Return-Path: <linux-arm-msm+bounces-95712-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gPOPM+BtqmmIRQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95712-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 07:02:08 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 73C1E21BE92
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 07:02:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 30BBA301FF86
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Mar 2026 06:02:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C34E340DB8;
	Fri,  6 Mar 2026 06:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GIZR7BNf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cNp0tLCO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5263630B53A
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Mar 2026 06:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772776919; cv=none; b=CLlpiCljIGsf1ooqri07GGfWeW6vBAhEO/vFi3STAkZL21crqcXhs7b63xkXpae0WYdqKMBbpn0r8+Gw7r/vkQSQvwQRLtYE33okCKkBpLOJDvn2U7Tcfhizu4xk7XnHvtj/QCLIln/oLWrDPVPx181zSOXL4R4tjbyK4AF5Zy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772776919; c=relaxed/simple;
	bh=GzTLSMPHExwAy+6CUVsKaw1CSSI421JbGQHa7+s9Haw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=iQx2f33wLjDiw3rAx839P8DaAxv3IBYWCDUTmQdD6ugDbtU5dwY+gU8b+N71MZdW9CTh+/T8ot7I3RQaQxmbAXguc4GL/sEZH4veN6lq0ksB1l0uRnpeRf/+p+L/aOXBchdLLBKjoARJwmrKWJ2OBUOiZ1ZtYZ9U+KO+kTC13s8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GIZR7BNf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cNp0tLCO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6264aUMK1087363
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Mar 2026 06:01:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uvxxD5R2g1eKWFZrtyXXoI1KYxWzBTsSDcmN5FvjfNg=; b=GIZR7BNfEcvDTUgK
	9n6eapf7PspeSBAYS+veW9/JdXbb+Gw9sgLVG5YwqOzgmdvLO562jArO/l8fLpOm
	v8gjaCKTxUUueU1lQ3d5VfxcgQ1Nw3LKJi9o9lIPO4iQ+3tpC7WndSIsxcqn/Xb2
	BNcsnczva50mCP5UESTi1/rWnoCGCptrTE03NRt8c8j5FHr2v7NQj589q+eknOtg
	PXqW0tkEUY1NMN2lg+EISEAqIr+aeGH2/MYnrWcNyrAaLKZlgrpOS3r4NpqAG4Wq
	6naMb4OMi9z0Dm3q0vVL+a3N89HjolcAhbi0aslOdnsRrg/SoO4gj5j3uSoPc4Es
	aSMvLA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqfg69syh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 06:01:57 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ae502a1dd9so66027625ad.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Mar 2026 22:01:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772776917; x=1773381717; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uvxxD5R2g1eKWFZrtyXXoI1KYxWzBTsSDcmN5FvjfNg=;
        b=cNp0tLCOm8VT/8XP+KIFM7wvjYEZopf899SX01rYzhtCnjlzFaGzgjiED+a1LEvPeh
         dDT8hxXlQdVBgIRILyM67xG2GN481tLMSGwUx8mH26LI5vDHglfGZVfJXO8P67f7pYcj
         gobThAmzaPcM4j3+EsH8kC57AUW+rWjbndxmLcNywlc/vpoKVH5LxuG+3Z6jSd8HMhc8
         CKw4VeaDSERcsl/qRcqKX9+yTrN/+aYHdIfMkZCARblxf0DacW23wECwcZPLksT5OcFH
         yJcDNvM//TDEGyn0oA4n6CaYy7ZkZQjdBVLb0eYQZT4x+MNqxoOvc4Jec8R8gVURGC8B
         H0bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772776917; x=1773381717;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uvxxD5R2g1eKWFZrtyXXoI1KYxWzBTsSDcmN5FvjfNg=;
        b=Ur4Lwr2OFchRBmasT66aXx1X+vx11G15wwC7imeTalbA0Y7kU39mJWYFjBXjnZiL3Y
         +R4vjg7f0cvFbhnkNafgdke4MF/7m4o6pgneFpQMZrKL5BVySF2RwXqmQPb+jZTBRvSy
         pYs8byNSHBD/ISBT/ssTj+ngptMEDR1DQDOLbh8gsZMrCnzN4Monj0GsfwwzyHHemdvd
         8eOvGPkVLC52owmPR1/Vhg6jWDL250f8ZogoyaCbqtxvGpda2RJVkAl/VrqnxqM5p0Mq
         B0XHvWxSOglGiQBuB/0wNaDcnF4HLYoxfWrS+kEYzJayVVemluih2n/rOf2eFGRnieDE
         bNNA==
X-Forwarded-Encrypted: i=1; AJvYcCXtnhxQb8JMQk+AS9rmMXSrUh+Y14dyhEINDLp8vf3TfEZc+UtqMYajXLPMSK6DgiFvnCFd99XNwGm9XCLY@vger.kernel.org
X-Gm-Message-State: AOJu0YyrEqLbSCy7Jb9kGi/A8oaV+hAwC3A67jiBaZiB1WK4Xb2+91Kg
	icM+LPnP3EUSzX2IAHDSE2MKlOEk/pgV5IM1reFWwTxiUwnMMlDFvT/JGAYwk7CqUg1Vyp60Ok5
	YFxtD5sz3YRaOAEhjHmAfMddmsQTnm96PGBiSru6jjQpEDv9obTquVobznkUwLpr1aWUO
X-Gm-Gg: ATEYQzz1+YzeMLKXwx7T93LLSAhllZjf9nVc7a3112yM77Fqab+OqCsQJ6ZkpkEsKvv
	7LFivOPH1hoPtb8IN3PlsDfaewzYy9YC3TM0yfkVex6Xqcuck+iQtFR1uLREmzRUI2iUw2rHe3J
	PD6N7Iubt8VS8ReQ6OBjJUcii26cKd6uOGlwb3W/Mj2Le78yAj7+0nz/jO4QQrH2PUC9Odxj0xb
	fwjoi5edCgN/vAhLRi/IZhrUo9P4JgoqLKxatsWLn13L41Z/y4L4iocTl7NRMPHoo+uOxenCZj6
	8EapkM0+hnhE+gJW5rUUUXr8BqnkbhYxCzerUhqUJntN1WPFm2y/NN/SHR+udBjzrtlTwFmluk3
	TjWR11z+DhYdkc4UM26brVngghh8OZHX0ciKnw704AWDM7mo=
X-Received: by 2002:a17:902:c40f:b0:2ae:803e:6c0d with SMTP id d9443c01a7336-2ae8243b636mr12263625ad.19.1772776916897;
        Thu, 05 Mar 2026 22:01:56 -0800 (PST)
X-Received: by 2002:a17:902:c40f:b0:2ae:803e:6c0d with SMTP id d9443c01a7336-2ae8243b636mr12263295ad.19.1772776916367;
        Thu, 05 Mar 2026 22:01:56 -0800 (PST)
Received: from work.lan ([2409:4091:a0f4:6806:a6f5:7b5a:25de:64e1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83e7c58asm6644065ad.25.2026.03.05.22.01.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 22:01:55 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org
In-Reply-To: <20260212-eth_vdev_next-20260211-v8-0-0974b3a8d61b@qti.qualcomm.com>
References: <20260212-eth_vdev_next-20260211-v8-0-0974b3a8d61b@qti.qualcomm.com>
Subject: Re: (subset) [PATCH v8 0/2] net: mhi: Add support to enable
 ethernet interface
Message-Id: <177277691237.6655.4175169329604491727.b4-ty@oss.qualcomm.com>
Date: Fri, 06 Mar 2026 11:31:52 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: Q0HrlcIqTlm_Z0H76lLiOHeRjoCf9Y9Z
X-Proofpoint-ORIG-GUID: Q0HrlcIqTlm_Z0H76lLiOHeRjoCf9Y9Z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDA1NSBTYWx0ZWRfX5pyYq2kJQ2nl
 M0NghLX3x8jtk0No00wUZ1H7amRLMp9WAs3N0NbxsYWC6IvHKQQNJSp0lbLTqjK9/6RpHEUG3kw
 LO+NXhs/3/Li1d6xVxLXV3bM7tAWu/KlfN0vV5+ZswTgfiekgqFlqgzWWbXYmfRHamNte7uTz+w
 4W8bxWfttzA1pO9OXdYV5VVRE2GSOSJm6udvrugr5+6Hspx+FPBtrPbUDd7l6Id6Pxo+4rl8U7C
 zFRj6UqezhFoQNsd9Dt4hngQ+4f0rzBTlf6dhaGwLOs+YePxsuR69B1mZKBd5M3Gq1RwtdWty03
 JWXkjHM1U0eFMKwTfxrZrlBd2ehmrWtUdPrEGU4APCCSKA3/zPLnofdjztxNopT0l0rZJdrNy/C
 juwNtnBMYJgmHAfeycA7TXNY9AQuoBsIaU5ueOqXlWLt4fLVqDs0lhNtzH9zwOC4cI4rGtDY3Vl
 SF4mCE2vE2sq/5eXZ1Q==
X-Authority-Analysis: v=2.4 cv=XKg9iAhE c=1 sm=1 tr=0 ts=69aa6dd5 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=w-hdCPvak80ow5GQZm0A:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_02,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060055
X-Rspamd-Queue-Id: 73C1E21BE92
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
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95712-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[manivannan.sadhasivam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action


On Thu, 12 Feb 2026 16:30:21 +0530, Vivek Pernamitta wrote:
> Add support to configure a new client as Ethernet type over MHI
> by setting "mhi_device_info.ethernet_if = true". Create a new
> Ethernet interface named eth%d. This complements existing NET
> driver support.
> 
> Enable IP_SW1 (ch:48/49), IP_ETH0 (ch:50,51) and IP_ETH1 (ch:52,
> 53) channels over MHI for M-plane, NETCONF and S-plane interface
> for QDU100.
> 
> [...]

Applied, thanks!

[2/2] bus: mhi: host: pci: Enable IP_SW1, IP_ETH0 and IP_ETH1 channels for QDU100
      commit: 3cdd83ccd7d0d990ec55b35c8a794d84b22a9fd0

Best regards,
-- 
Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>


