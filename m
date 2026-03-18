Return-Path: <linux-arm-msm+bounces-98567-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IOHvHbMgu2lofQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98567-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 23:01:23 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CEEFB2C3372
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 23:01:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4CD75308AC07
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 21:59:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA3E0347525;
	Wed, 18 Mar 2026 21:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ImuPffFz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jipYs3Kv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD589342C88
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 21:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773871192; cv=none; b=bHGayMgHEybRxbvB/0D1zhkJ6uWSuc+RlFBEJX6MQ/jAf5mDrC2f9FsssuC2HZrLF7qAyaVIt1gu5/LmPJnAWCZ09i9Jopw9tAvvifRkxESu5wUH5BVsUPlyaoevDpEu3xPddFqBRFDr42J6yy2oRLDb+u0/OJSCuvH+M2uwLfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773871192; c=relaxed/simple;
	bh=lraAAFPPQWNZUci0uXGFjTSkJNRLITB2mNkNcAsWEUQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hu3n9d/q7n/L5ryzxmDrwiVsjNlZePQMzTN3k0FLQrmI49MQ8I2q54DSf6/DO1kEPhLo227P2puAxdurMvhVQSf0d0wXNTbHLOpgVo0IEkjDltYsOpklJA+Ltv0Qx+i40UMzP3DG0juuGGHjX7BeDgI9RMT7/2Dy4bBDnTa3hC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ImuPffFz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jipYs3Kv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62IHR7QI1622591
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 21:59:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=LBQfztnTegzW29zYjO4bRrqA
	t8SvJ6u0ZfA1KTQ6Eng=; b=ImuPffFzh+izuKvoUtZOB0iA8+kgAAkRr078s41T
	ZD/M5cof8k4lJNIXOExcLiZM5Xbb4eXkDorZ0rlqdBZb28FfgPX0+dA11ZhrLzcy
	z7X82mLhzRXB0vyhPBE8YsUNkA4gINaFYLVyP372flfafTqDlESBCERgzP4xl1Sw
	DAexbPokk+/dHj1rzkcKx5/LsQ07J6aQ7L/GLIxaX2Yaq2pk4nMSX239Qyi31xb8
	LF3Vt1G23Usi0uUJF2wzdcFQnMYLsNeUM7Vu9sUAJS/aNJszlqk/9bU00B7v6MX/
	nD9fVQgIkr65NBxzhCd+ciOnqKHcgMdZnd+v72rxst42DA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d00f9gsqp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 21:59:49 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-358df8fbd1cso670461a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 14:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773871189; x=1774475989; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LBQfztnTegzW29zYjO4bRrqAt8SvJ6u0ZfA1KTQ6Eng=;
        b=jipYs3KvYAhv3f+tFPygcEl4hW8lHcV/V2X4+rStZUGTemUiB+9/Dm5Eng4ep32/2R
         oRqdJNshAnMOki4PDJWG2cDILw2OiHKbgRdzAU/DkpZc9WRZWL84SK93rBERmUOUXDoh
         +neSsC5ruae7H72z1Ir/waxO0um5iG4jSeGo+U+hv0Z2A3rqVkB/4WE4b6N5gw8hghm0
         R25Zq3hcgMfO4DWXMIJSmxpAeuFXqlEb+wSECNrNLDJl1xwfewruoekW0pXZEGROLXht
         ZekhlzA6uf/17VYJB8ZBxbT6CuD0+u7okM0LGBy4+ralbYbbcOfUytA6ZTl0V/mTY7Dd
         GLqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773871189; x=1774475989;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LBQfztnTegzW29zYjO4bRrqAt8SvJ6u0ZfA1KTQ6Eng=;
        b=VlJ5BYA1u/thc7eH+jDdbXhkUBOWZQd4aT0zwziskMfLriGdNRxzLW9tfjblE6xpwr
         JYnbT2PhK2h7f8n5rGzNfJoTLuGumP+bpDh+qBGqPEG0YsOc4KmgK9oDee4oX1mtEAEf
         cWLybHjrLQKKUEoZTmdfQVTKruH2AXnCE5sjrQk8D40y5uLLvfc25teQDEltkZZiCEj4
         QfIqmcaeCLgXZA2/o4/qfHeBiqHzMqnu1nJ2o2VxNI93sg/mhncAka5a8Dkq0U2eE5hd
         bob/QqtZcwMSpPCvp761GS4JLgjAonqS6cQxSoyoQyly8LIKP/5oqrBS+0/PgjPd393/
         eNtg==
X-Forwarded-Encrypted: i=1; AJvYcCWtl/mUSKR25M/JLDeEicEEAcRxbcXI2DLg0qsWHUgEUpxEw2nfNOeBrbimUCaLM4Qu2XmQj+FwxV6mFhiC@vger.kernel.org
X-Gm-Message-State: AOJu0YyRKwFiFHMz905ky/e3bklLs58bvRDS0pKqKCJVeZnqdVs+hFj2
	FlmhsjsTOA6dopDkGCn2qlILHmURBMyP/htntsFpu+5GCwA4NWA+ZqOGjPvZ0JAhxKMllcHVgo/
	iaAeHnRepwgg+HcRq5FhnDEo2HqOFWEST71a+RlVhz8bRhl1jQx4HIRAY0Uu793+oMbX5
X-Gm-Gg: ATEYQzxHhQzQhitH8LC6vXQhLWEAeiecDtO4HZ+iyEG0+9E1qPRWqr0XtcaDL3RRRmz
	GeXdc5Ax0HQJ0J4Pv1orN8+UyMb+ZqbxvSHyfznVbWcUlfK/zHZhk39IQxOk2ab+PNNg4/HF6e3
	c3kdpdCNHIGKa+1MdMtnDEElO7RrgirMFN/4cIcWfmfbjDbZURIPf5Q7oGI/ORkfYNrZdEkEi7l
	Phzmd8lxiwVoafRhJK1yY9lgxkN3sIDkNmlP7lvGUqHXEMm3aYHkumhOUbUWhhhwn7chrD13VTY
	6SXtODh999ciiCRHn62OoF5GAPCu+8cPP7YZpdfkDPLNRa0DdzzgVOuUx9aWtUyWawM4sJIFACp
	3cCUaCq+wEz+qjYNpfgPoJqKsI5pcbZzOe8k=
X-Received: by 2002:a05:6a21:1343:b0:398:9ae9:7110 with SMTP id adf61e73a8af0-39b99cb7f07mr4358090637.11.1773871188672;
        Wed, 18 Mar 2026 14:59:48 -0700 (PDT)
X-Received: by 2002:a05:6a21:1343:b0:398:9ae9:7110 with SMTP id adf61e73a8af0-39b99cb7f07mr4358071637.11.1773871188066;
        Wed, 18 Mar 2026 14:59:48 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c741e0dfdddsm3291363a12.14.2026.03.18.14.59.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 14:59:47 -0700 (PDT)
Date: Thu, 19 Mar 2026 03:29:41 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org,
        Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH net-next 0/8] net: stmmac: improve PCS support
Message-ID: <absgTcRS+JAdBs3H@oss.qualcomm.com>
References: <abQC7r38QLhSeadl@shell.armlinux.org.uk>
 <abdEscs44fU4kRag@oss.qualcomm.com>
 <abdYu864OmNWiWIW@shell.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <abdYu864OmNWiWIW@shell.armlinux.org.uk>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDE4OSBTYWx0ZWRfX27w7ccnKcHXO
 W4Hf+bJARGKXudq1kpdlUMRo3GBv30ZGEI6owjs4PyjzVMTIJ0bXttMEvIoedGBozN87Ch4MwgK
 Ino/b5v4CE5FoCmM0OCMiGOD9VzpLnIVI9uo7NmwGEacWmPtR1G2ijuYj6OC1Y38jnmPDezUaN3
 HNiKEm3AJXw8hTlZSuvgApUcZE1+3JHfC5fr0RQ+pZPOk7QiVlQNz8t5/QpO6b7CjNGQBZSg314
 RFNWqlkEiy4bE1PkLv1NrYPpx//S6nbu4eWRyd/MK65cboiIG+CWRT5TLPYBhrledSMVdwvpmnK
 x9jjHjlI7uey64m0P0O+A318VzLXIaRlkltIjunCUd+2KoJNshUUWHJnDRmWjZHb3Zg83SC14Dt
 bOjYvinLcdICktnhI1L7y9QbQ1fIXAo9Y35nK/7pe5waDIUQz07fHv52ME3LAKxIz2vfmJSW9vy
 kHdCO0VrqQzcXWlS/2A==
X-Proofpoint-GUID: QBwzDzCmfUYNNMo9fH0PhE5aeNpchuEL
X-Proofpoint-ORIG-GUID: QBwzDzCmfUYNNMo9fH0PhE5aeNpchuEL
X-Authority-Analysis: v=2.4 cv=MJttWcZl c=1 sm=1 tr=0 ts=69bb2055 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=OIreufjBPOA6zABoq-kA:9 a=CjuIK1q_8ugA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 bulkscore=0 malwarescore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603180189
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-98567-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mohd.anwar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.982];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CEEFB2C3372
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 16, 2026 at 01:11:23AM +0000, Russell King (Oracle) wrote:
> On Mon, Mar 16, 2026 at 05:15:53AM +0530, Mohd Ayaan Anwar wrote:
> > 3. With the recent VLAN filter changes in net-next, ndo_open takes a long
> >    time to complete as vlan_restore_hw_rx_fltr() tries to write filters
> >    for all 32 indices. This board previously timed out once, but now
> >    times out for each index. This is a separate issue unrelated to this
> >    series but I added the following workaround to rule out any timing
> >    issues.
> > 	--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_vlan.c
> > 	+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_vlan.c
> > 	@@ -158,7 +158,8 @@ static void vlan_restore_hw_rx_fltr(struct net_device *dev,
> > 
> > 			/* Extended Rx VLAN Filter Enable */
> > 			for (i = 0; i < hw->num_vlan; i++)
> > 	-               vlan_write_filter(dev, hw, i, hw->vlan_filter[i]);
> > 	+               if (hw->vlan_filter[i])
> > 	+                       vlan_write_filter(dev, hw, i, hw->vlan_filter[i]);
> > 	 }
> > 
> > 	 static void vlan_update_hash(struct mac_device_info *hw, u32 hash,
> 
> This problem needs solving, and I suspect we need more than the
> loopback here. It needs detailed information about your hardware
> design, and comes down to the missing receive clock. stmmac is
> unusual that missing clocks affect the accessibility of the host.

I tried finding more details about the hardware implementation and
it appears that the receive clock is sourced from the SerDes PHY.

As an experiment, the following in __stmmac_open() avoids the issue
on this board:

	qcom_ethqos_set_sgmii_loopback(ethqos, true);
	stmmac_vlan_restore(priv);
	qcom_ethqos_set_sgmii_loopback(ethqos, false);

What would be the correct way to handle this? Right now, SGMII
loopback remains enabled from qcom_ethqos_probe() up to
stmmac_mac_finish().

	Ayaan


