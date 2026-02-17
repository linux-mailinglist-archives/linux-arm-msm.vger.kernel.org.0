Return-Path: <linux-arm-msm+bounces-93216-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qEj/LSm1lGlbGgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93216-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 19:36:25 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DC8B714F366
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 19:36:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A4C443007A45
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 18:36:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BB05280A29;
	Tue, 17 Feb 2026 18:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PJoYPYWQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="At4cQ1H9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D090929B8DB
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 18:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771353366; cv=none; b=KzlpAPPa9kd7Y53atdsN2evUP6Xz71KsK+IYtbeke5t7hbwGLcClv8LqCfMzdcPTHY/tl90vLX11H8rQhZzj9T9tJSXEzpOTz77FQ6d7GzrBZWo+ix9qTiUPqYG1z2UYx5HMvBRX4al+FMT+SD1Pj3CuZlK0wtXxsIZJVS0kuck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771353366; c=relaxed/simple;
	bh=9uAHBw/2TpRNgIOnjFladpYu34dzrYRFTycnroCjZ3I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VP5aCt4Mfo3vxsJCBtM4Wima4X6VpMJy1Q7yfpAI3N2sWNmmzKMzAwO/TBJN4IOm2TbMVsd4eX+JT3y5QwLQfUrNJSD4uTNtEzr+ZLZTAycn7r5uAAH5T6dqU5r1eOmevRgGg0jiz8ZxHUx93Ju09L57EPhcK/kwR7Az2Pwq42M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PJoYPYWQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=At4cQ1H9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61HH5CeA985497
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 18:36:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=uMrQyicAZEEqH/BJVyGmHveM
	n6L1dPKlkyYCF6REmA4=; b=PJoYPYWQuUsB5FEZvA830Cal0DSGAMo+QGMVb6W5
	+dkW/CDoED86KiVFlyG//hqnjoEscrW4RLYHTuM9ACB5yFBkz1qYTYyJrbsef951
	j1iRi75pMnls7+m0t660Cuu1/7TRi6O1B9IgeLY2ZpQijJ+IfsFmsr8AsFdoCsu8
	GnvCWUwr0VmtccVe2H/8bIP+CnqKzc20mjEFOJWZBeAgDweS2CeGT2SoULFxFlbJ
	VXC6CkXFWByQXTsusr7jbwnJXgTIZaa/gjd6wba+gTqepAPx2QNIzf7W9gqMc680
	7UUdi6G34Dgvr7IYZu7HWjYs714WfEzqQrEJWJtrKmoP3Q==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc7ap3daa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 18:36:04 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-824ae2c9ff4so11707596b3a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 10:36:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771353362; x=1771958162; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uMrQyicAZEEqH/BJVyGmHveMn6L1dPKlkyYCF6REmA4=;
        b=At4cQ1H9iuG8x/qQFfj5pTPoCY2unoxH44ZTzM5BDRq7DbfX7whZHSy7VqTnh4H7cz
         SVVU/aUIZyONTOGYAxnXZ8iWfjq6yT3kc/qxyXqQ0J6mLXJDqI3H6Gy4mfSOtcOzvxKs
         vhbhW9n00XnJYY8QqrIw4rpWRk5ZXZkJ1JHkbo87hZ1u7AlJp5yTskNWV53ThLDvcPgz
         f+Vj+IyiILpOZHUrvFYrAUEfkvHm7Nno/y+zJWhfcV3k5dvhKdSB+g1EUzNwH41/OP50
         Qb714qoSCOFnwIv/8UODhk2t/Iu46+SvPiW4jg7Zro79KCwewt3YQdJXh2Vrg36BL4JY
         qkxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771353362; x=1771958162;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uMrQyicAZEEqH/BJVyGmHveMn6L1dPKlkyYCF6REmA4=;
        b=TgZBXz05NwROcAOyUkQBJ485aGjb6q48/c1IGkt080wywbVPcGFHcebdQ+McXf9AN0
         uX01OsbJEmAuZ/PHku+YW67dP9EPLvx2iquh5k8AZNkbhpPHO2P0TBO55+R1yskpe6wI
         g7s4KBWmIfgnfT2ptrXgzQob7phQ8EAveG3DuTbAVH+UGcWsCyh6+nD7/OU/cLjYdA3C
         vjNrHI2PcX4EYOy9ZQn4/Z3GE+Mgyc4DixKv9Xfl26m1oegmY8A7LC42MQH/ptJxkiSb
         +WytvmDSh/q77PJtwj6iVq5NmTVljxAi4tLUw/dGhmOV4Nid53XmJNKjc3R68zSlopLq
         3LmQ==
X-Forwarded-Encrypted: i=1; AJvYcCUpThJV+vto+mSNG60wETDbN7h7GXQ+bcet2r/iwCoM8mGGtx69zD/AQ5Ph1Q/8qSo22VrNXRAapXkIeT5I@vger.kernel.org
X-Gm-Message-State: AOJu0YxmDaaYljuMFh6aiXmqlJuJ0iPvpNbB7OfFGSHe696PNimLuxy0
	2oWZiFErZWbwXVc0WSYij1geSZQGhxjDZY+25yt1RTVs1MdVeC9hPTyj5L3hMz+PiHVtbHutwSQ
	F1NzwDDgwaIAEMGH+hF2nrRzbYstO0JM73Q3HQGt2I2E4Qn3qADh0rb5H6qT4lLm6bzgc
X-Gm-Gg: AZuq6aLYV26aGKx1DtqgVCeD3oJS+l1lB3hNqaFjv10NLicTlYi1mXRe52jvjbpOp2q
	OUZO9Idz9986zLc+p2Mftq4PM9fAgAN5tDWb3jqO8zrVCgkp2xKowhmJKQNHXQTHSzzC5MkszR7
	0zRZypndMol2QsbJ2raxpBTlbdYo5z0VCujGphWY+r9t4Y++dvLkesC8AG1I82/c5JhV0otNcyN
	Fopo0OM1vRhpdG+UBUAyxh14217/WBhhptl4XNPForkdrdIYx7YFMcGzdmbJtuKuCT4Cig85p4M
	d5YOpQAyCozyRREPP2laPqSmhReTjn0lV1IyV97SFCe7iXq5IBoco9NOB+X5ZMhq1TzoDjyxALq
	jeqQlfJEd3t+jsQE1MgXfcDinQInmuq9GqFM=
X-Received: by 2002:a05:6a00:808e:b0:81f:5037:a317 with SMTP id d2e1a72fcca58-824c5ea230bmr15684877b3a.11.1771353362499;
        Tue, 17 Feb 2026 10:36:02 -0800 (PST)
X-Received: by 2002:a05:6a00:808e:b0:81f:5037:a317 with SMTP id d2e1a72fcca58-824c5ea230bmr15684842b3a.11.1771353361950;
        Tue, 17 Feb 2026 10:36:01 -0800 (PST)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-824c6b69b13sm13401027b3a.30.2026.02.17.10.35.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 10:36:01 -0800 (PST)
Date: Wed, 18 Feb 2026 00:05:54 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Frank Li <Frank.Li@nxp.com>,
        imx@lists.linux.dev, Jakub Kicinski <kuba@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Sascha Hauer <s.hauer@pengutronix.de>, Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH RFC net-next 3/9] net: stmmac: qcom-ethqos: change
 ethqos_configure*() to return void
Message-ID: <aZS1CigRWTH12scL@oss.qualcomm.com>
References: <aY0aJppQWUC52OUq@shell.armlinux.org.uk>
 <E1vqKP6-000000093mN-1IDF@rmk-PC.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1vqKP6-000000093mN-1IDF@rmk-PC.armlinux.org.uk>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDE1MiBTYWx0ZWRfXwckIXnkAb1w3
 x75qTk4fPkc3jDiiXycSPKUGMAWU0oDY3c6a1pdQm72u4rwuo/IKDTcOuoXPfqN3pS/Dq756PBm
 I6nI9nX5hddtbrNqRSePasmDbhWaYaWSLBXfizS2CLH4NpIGySWknA3pUr8pnwr2O8gmSUhOnb5
 f8c/ECUdrCB5lrlov/xnRWCVvhCem595FZwR7NfJ7e8R3xRpNZY/+o/hvF4oeJWM+89byp7DcA9
 C+lOk+izLIWU7I1Gy9VbhLQUx+0l9rW3kz1wFFVoboyXMereevlYeLK2vniUc8iQaIWPZugm9D1
 Cf3xzalmjdekBckb3xzSHyKN0VyhjR7ovMRtr4dvn4E8YPe1Ge4l8WdobxaS+9JYDeX9hwK0aqT
 wR/EPkXfK4Lbac00KkkygFV5QF8YwN8+o97klsY7+A7wtgurE7JUY3NFbhC0Z0OMjxlQ6xeDpPS
 fZD8/em0ZYuGGM1uRlQ==
X-Proofpoint-ORIG-GUID: UIaU_9f5rmZIZYgl8y9kqsxg0Ey1q2Ku
X-Proofpoint-GUID: UIaU_9f5rmZIZYgl8y9kqsxg0Ey1q2Ku
X-Authority-Analysis: v=2.4 cv=Rfydyltv c=1 sm=1 tr=0 ts=6994b514 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=PHq6YzTAAAAA:8 a=EUspDBNiAAAA:8 a=OS3fFONSsTUfBaauNq0A:9 a=CjuIK1q_8ugA:10
 a=OpyuDcXvxspvyRM73sMx:22 a=ZKzU8r6zoKMcqsNulkmm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_03,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 clxscore=1015 phishscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170152
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93216-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mohd.anwar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,kernel,netdev];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DC8B714F366
X-Rspamd-Action: no action

On Thu, Feb 12, 2026 at 12:17:56AM +0000, Russell King (Oracle) wrote:
> The ethqos_configure*() family of functions always return zero, and the
> return value is never checked. Change the int return type to void.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

	Ayaan

