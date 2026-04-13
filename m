Return-Path: <linux-arm-msm+bounces-102977-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QvLrFDEM3WkOZQkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102977-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 17:30:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E33763EDF9D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 17:30:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CE36B3096107
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 15:25:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 971A03CAE76;
	Mon, 13 Apr 2026 15:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O+mOuETM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F6OfzxFQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 502D826A0A7
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 15:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776093940; cv=none; b=hFA0K3ZxeuniS8+jQjfoOiyr6s45y3E2e8q2kNyVdCYES+LrH31ofOOFQveMqnIuBAH7quTlGlsUihQRodFgyQW0HLGw+BFVxlsRQkIEbfn3Sh4ESQsXada/pvUoS7cFO3/bAWBSwdYUGoBx7f8tS2kh8ybdLhhss8+wYYLI6og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776093940; c=relaxed/simple;
	bh=GYGj0slXz7KuN30SwHL2g1WodTxjyroqUBFhNeDtSwQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ppv7qckKAtYgyDHfkQi09igFBXK7u4hJzNUXVxRyTkcT09ocdufxG5RFUVZ6daTsjZgrKxkiAInyTnf+Gs0w01fMQ/g19Mx39I7zN3wsCTZqESbYOCOcAFJhgYoex+MhFpw6i/rlWmbljQEXi4Nr9wyiocKOfKun7Kl2D69gyWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O+mOuETM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F6OfzxFQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63DAVFvs2231027
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 15:25:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=W7S+vUEanThPK3tKQ/ENkOAh
	TzWh25gKbMRUR+Sltyg=; b=O+mOuETMsOD1Hdkv36rivzxWGgghacXt5ZiaJjqH
	VVBGfXm591/A20ThHPCWqWm8Jees5az9nUawjU7ZVmTdROLmn+dy8TR55rXN+j9L
	nqH++4GZQbX4etCtnkAUDol2pv+4uP12GxSIzZ2IjEsNhPiNIoYuy66LSQs811F/
	saVfY/NlCRUUUaZaRxu3b44Xj3YxbJm3LFnV+cSmoBcQBaLZu1kEqhODm4trUcB9
	Ah4K6y9NDB1ijXqJIYj5DC+KruGbAZyBGuD6LpPwTELN+m9PuTz4O1vYLMnZO1tN
	hh8xrnnkd+FaXeASaSgNq6Mjme4jFS1xfHzbWCjpKTo3oQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dgxt613vv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 15:25:38 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b62da7602a0so3223869a12.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 08:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776093937; x=1776698737; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=W7S+vUEanThPK3tKQ/ENkOAhTzWh25gKbMRUR+Sltyg=;
        b=F6OfzxFQRCgkBUuUnxW7JoUJ2Ljui5FxM1Go8oqAyyrUBDTsbJ4lS1T+UB9XIdrOx9
         7VT4AlALsxzsJ5k6tSDeZqkD8Rt6fWX5aLvmst//EFamVGW86a4fytnXv9wLrhB5bFxJ
         xkH+1wzDAgZVhUdju9NtkUjeLo+efN9JUZG9ivSW1AeTXWDjfg7e/MCPXSQQMpp7PX4I
         FuyYsmIz2ML82+0jn9M20xrMI1x+pSTbN7HTwaiSXJlL/QMs1dsxqzGzPma3opNwLRJS
         FDDy8cju6DhsDTUDX1cgVY5HWJ7DcCEiWYCcFNp7seZgYbK8Qi4pvJQEbrUAFXOnI/Dr
         dtwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776093937; x=1776698737;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W7S+vUEanThPK3tKQ/ENkOAhTzWh25gKbMRUR+Sltyg=;
        b=RsRAjbYSBdnepi0fCa7szwxgMYSvJkQ3AeHPJVWKl4jYlOVb5kS07SdOzH59jg9IJC
         6nc9kdcxw4NkNXYkcbARDODXBhk6FGtJ+WmJop77JMzZdEH9Y404vhSG20GdpMGagLu0
         kSJsY5jM5HeEJKyQu0hxYkyLPb77JMfjc0MKTsmEqkDdMorURyz743YprZGDhNv4DqBx
         BIBUl2jgxZI9NfivNNSVSgkLRyhU5gJsAnzjPj3SETGYEruinDUqOMxFM2oMnRMUJ9Au
         U2IvptHtXh9nYxA7IJnsDFnvAojIS7UbYTsU9FJgnK0Kut1nIIfNJCNN3xeUG1w/nOzi
         b8IQ==
X-Forwarded-Encrypted: i=1; AFNElJ/LR3jiGs2i9jSYDvpka9R44hWJu3ITfIWnyuBVUQE49NgYXqOXPU2dvChQKn3GN5+1bbJHcB2DB3azfYGs@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+TTfyEeNL9NTyZzolivQLu73NXmZG4jQvEB8ZFwq73l2TaHVl
	yyZt5VdqhMPL28VkYTUPAbwG6iLsoQ85w7t2HShlR8i5xPgYIrkO/cTqS95KvGzBZKL391rubMS
	r6Es/nF3k+XmDrTxCDpo1Q6abb3/5fbn5r9Q1+gy4+JgBwOWkDGJSKo7U+1+d8SD1xHOm
X-Gm-Gg: AeBDietFNVu0Fou8kVPtZF3Kbxq58e8iXYtqO3qaiEg/gXjHauYWz7we/LHdORznbo7
	+nr4kPVZydx1xlVDQEr4X4rG1CAEkSZnhFb21Crd7W5cXCY7Nb/4aTJC7O8mJB65ZbppqevgkXz
	s4aSEaB2bjCbT/2uy/NvrOoTvTVBuTDCkgGhJ0X4MNGW6WzeWBy4pL7UQxewTDYaTUqMehWBQhQ
	6rQrFJr8YPSY7udpdl4n/dMQEY3691ZDHtU22nKKnpAmC5+O1gV7HDlZ/i81M7diPab4SbHgdBf
	py2WVK4Zn69R3evs4XiyguxgYNIjb0Idb4mhYBP3QQ2co1yrAy+W7e+gt92AoHKfwCuPtY588yu
	MEjZtfWJBgoXE8Ia1WLqGQsPLqEoadJoj8BlPWQ+v1IzAOo2G
X-Received: by 2002:a05:6a20:7f88:b0:398:c2d8:153 with SMTP id adf61e73a8af0-39fe40e3b2fmr15011289637.56.1776093936885;
        Mon, 13 Apr 2026 08:25:36 -0700 (PDT)
X-Received: by 2002:a05:6a20:7f88:b0:398:c2d8:153 with SMTP id adf61e73a8af0-39fe40e3b2fmr15011234637.56.1776093936300;
        Mon, 13 Apr 2026 08:25:36 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c79216ff41dsm9633095a12.2.2026.04.13.08.25.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 08:25:35 -0700 (PDT)
Date: Mon, 13 Apr 2026 20:55:28 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Francisco Munoz Ruiz <francisco.ruiz@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor@kernel.org>,
        Jonathan Cameron <jonathan.cameron@huawei.com>,
        Rob Herring <robh@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 3/3] soc: qcom: llcc-qcom: Capitalize LLCC/EDAC in
 comments and diagnostics
Message-ID: <20260413152528.muemkbfuow2qg3ta@hu-mojha-hyd.qualcomm.com>
References: <20260407-external_llcc_changes2set-v2-0-b5017ce2020b@oss.qualcomm.com>
 <20260407-external_llcc_changes2set-v2-3-b5017ce2020b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260407-external_llcc_changes2set-v2-3-b5017ce2020b@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDE1MiBTYWx0ZWRfXwIVu5qxnw1WB
 Twm9KqoMPS3ruCCj5yE59vAzby+nXNOGrHBbWi50U2yqUTQbYIe1BsWRDcwckoztFcvUF8kkdvi
 nOZ59QzY+3z/Kl5tQGlWuT597z3XxRZjnn2+9vmdayTFYVqwInDQuIKP9FCH0DQiM2WBD6tToh/
 iHiPPxsBfomH23Bm4RL67uiLcbokdzcMu3Y6I+NTrlsQFyOmJ4VHWZY4KKjO19a5ZIoJC6b93v2
 Whvk3Te8+vNROwZm2oykdu8pbvzbwgaNGcbsWrIX8UUtRWymRCil3KxADUODivD/2oPmrMgopkn
 p0yH/yCWKa3KZ6qZz4uakS1AzZI7nuMNvNFqKOesUQ6TjfkmuGGtPv6Bz8y4i+iWyqy1N18sjVe
 +yrWviRahB8vgbW2eJDWhJXAru9UaMLvDKlHl4xXErUGYxR5UShPKMV6BHNX4YessyS1zzjxA5a
 vttDqiUJ/XOMdmw6c6A==
X-Proofpoint-ORIG-GUID: 9cg7BKuR6tfzHklii-F6csLCCApjI1Va
X-Authority-Analysis: v=2.4 cv=br58wkai c=1 sm=1 tr=0 ts=69dd0af2 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=wMJL6MW5WnhTYwIOHwEA:9 a=CjuIK1q_8ugA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: 9cg7BKuR6tfzHklii-F6csLCCApjI1Va
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 adultscore=0 spamscore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604130152
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102977-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E33763EDF9D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 07, 2026 at 02:51:49PM -0700, Francisco Munoz Ruiz wrote:
> Capitalize occurrences of the acronym "LLCC" and "EDAC" in comments
> and diagnostic text to improve consistency and readability.
> 
> Signed-off-by: Francisco Munoz Ruiz <francisco.ruiz@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

This could have been sent alone..

Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

-- 
-Mukesh Ojha

