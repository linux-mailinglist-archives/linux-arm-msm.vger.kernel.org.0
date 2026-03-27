Return-Path: <linux-arm-msm+bounces-100387-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6G6KKFe9xmnoNwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100387-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 18:24:39 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 059D434847E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 18:24:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DB664314248B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 17:13:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72A1A3ACF09;
	Fri, 27 Mar 2026 17:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E7oWdf+S";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d81kXupg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EB403FEB04
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 17:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774631465; cv=none; b=C+PCE2NX9HVOooAtpeIw5D5jNsiqHUfSwiaS65XIhdobV7jX77uEgrnpwZDhAOTAh7cGnBaIO+HZUXs7F/Ev8oronhxh36ODNglvu30Ni8qOzUJo1f9YjOZsxykkAJrgqn1XubSAx0WNzBDdM8BmDQaeWVSvjK/7oSlv7TyNJDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774631465; c=relaxed/simple;
	bh=Q8wESV1NCABMEpjR37/CljOA3CLTBGYlaMhnOt8/C/A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O5oyfPa7jAkwFTMQS/nJb6kQ1x4gTlqbp1/eIf3Ac6uf+BfIrfiCJsd1wCocRgWYLp+JwB+YuZwmJ7zKvCCL7voQyafXnl/G7F07E26vLpSHgTn+C+5MOCDAG9urq1EQwnT/qVKl4+D/pKOcR8PI/Me2bmxDBG4otQCKdAFc07A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E7oWdf+S; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d81kXupg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62RDhXnj3701575
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 17:11:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JDo8erHL5bTFs5IKXSVY0JSCWDVTxNa7rvR9hgw1yNg=; b=E7oWdf+SC3FHq4BF
	GyDznWyB5ZEeEjlDN91+xQrJgtAvNN5U1sRcE49/cZE0E8GpaMX7/JLaqSnuPCIv
	0v+5T7czjMw6KrR9LGBRHLPDbQcVunQvsnUdhENiW9rizGkCuKyCYa5YMNqJN8Fl
	9mhX34tfvwQYEbZqv/7JpjPVFjy8PKNLHbbzXa5HRNryPGbXO0bxEPd8CSFEfbz0
	FhvwGafW+K9e4XB+unp9oy9SPpnT6vNLq/YKySiB3lyjp+DrTJ7yOp/V3FV9yywt
	I5snmQSXvP+sFhOy8dOUM80Duguz+xKFWiiaZBXDZ0bAzQpf5+ZpHai85IysUGU+
	IKgTNg==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5jcx2t7w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 17:11:02 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1276e71652fso2531416c88.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 10:11:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774631461; x=1775236261; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JDo8erHL5bTFs5IKXSVY0JSCWDVTxNa7rvR9hgw1yNg=;
        b=d81kXupgx0CCA2sBBEUxYNzsUgN8neVSwyYv51QceE2m7K+QgOkmKVFO+Cmu0eUIYg
         J+ZCW+20FW9ZjGVckMRLlJ7hblofyvZJFf7GsQUpqiBdv5AGDoN55/59xx8lspcdaT4e
         kR6mXHaZoVr2MnDhnZ36nRI1ZxB2jqJcI2ATIbIa1th8uoIlLejwn6IWw9QChvukBDIs
         te0SwnNVovbe3nCc0vSHp4qZV6S2GTedoTv+0JorEzEj60KBNYPXYxlNhGtpSrRE99Pm
         TeI9CEA+3pvBjVmUusUP/105k+uV6zXlH1N1qgx+MnHtyxNGqvpkZ0Hd0Y19bpFmU0JJ
         2GuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774631461; x=1775236261;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JDo8erHL5bTFs5IKXSVY0JSCWDVTxNa7rvR9hgw1yNg=;
        b=JCLPg92ENvPwo5Jcjn4m5t+5KS4SSAbdrH+TFWiqng70vYVV87aevmrm8bjiIqGknJ
         Ns0/R++CMgZ+e3477AF2nufJzPhCIrbUl1pSG3cdkUtJ8N22GMxHHHCNJphXT6rn4KF9
         9XwDDb4vW5hzfbxuuGPuhAoOyuXNBsgcCgefjCXipJ+VzKruGr6XZZx5Hogvt1tLIJkq
         SjyhnqKDLad81MHGWyMGSKjnXU6VVf95iYYKUXSXMfuNWFHv83PBeKnoCIgK7qGzjFuu
         QTl4XwWOBSFZi2EbJsKlpkKvBML2VAgPKuQf7pP6kKU20aEmSPkLGrTmWEiQOuTjomJZ
         yR9g==
X-Forwarded-Encrypted: i=1; AJvYcCW1Y6Uh4aDuYuCgMaevUCAVwIP6cgk9zmLkYy8j/fYDNGiqmj3QquLKSBnYX1hofNrlZyfAv/mtwfMmUxrv@vger.kernel.org
X-Gm-Message-State: AOJu0YzNObUmWHQQl/xPpoMqJxgdLYBhpLhUq3UW3RMmffKq3QMf7Ihs
	txWzxup5qIxTW0+SmQPrdsWICWylX/jBJgoBGfH/FaALoCCNyUWpVn0cMOniBR3RDuQD0Klhhjo
	7VuSMIH0A/ICOqbDFl7O+6Cm0VeeILgJx/9Ht5bmHKY8Y7CBnBjb+DIxqg/4wqxhYygU8
X-Gm-Gg: ATEYQzxk6dCleb+UtX+w9GRuFmjJeZ1sQUjqZoOMgyqWBhujbnoeyAPrfBDn2UmptTD
	9pkMIeMWBMqbo8cSadttsFsIe0I7WokIP5XoO/+yeASeyinU1Q7QT4wz7EI0/TQ8aRsSXmRFMMC
	OnGQx4lWB/t0s4qnEtGdfb9XnPW+BY1+Qadi9hpq4ptHO9N+MuRRhYs+Cu7lRtkMrCnhPwF/8Dn
	HwFs3M9KfeVS8cfP3SeYp+iGwK9cyHvLxeEv/6MhPk+MGsaBJ+NYu0LbmYHJSCEoUTg0VZ4JvkL
	mmMY/GLJkr9vZ1brHt/Mb6IdddC5pGpTYTMhBVYS7ydDf2fUkFdoHhdy7hHCajaixjU4hGTGBI9
	V0MtFP7UG+qpKpP+bzK4AC1M1EK18C9jN5QEgtcphvWxYg9mYPxeYpdPxU4nB6eIv9dxw3qOYO3
	4=
X-Received: by 2002:a05:7022:eacd:b0:128:d219:e169 with SMTP id a92af1059eb24-12ab286e527mr2008631c88.10.1774631461352;
        Fri, 27 Mar 2026 10:11:01 -0700 (PDT)
X-Received: by 2002:a05:7022:eacd:b0:128:d219:e169 with SMTP id a92af1059eb24-12ab286e527mr2008613c88.10.1774631460802;
        Fri, 27 Mar 2026 10:11:00 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c16ee39627sm5555001eec.30.2026.03.27.10.10.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2026 10:11:00 -0700 (PDT)
Message-ID: <0e330202-0fd3-4169-a5d5-414235535774@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 11:10:59 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: Simplify bootlog line handling
To: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>,
        carl.vanderlip@oss.qualcomm.com, troy.hanson@oss.qualcomm.com,
        zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20251223170226.2275812-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20251223170226.2275812-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=NfTrFmD4 c=1 sm=1 tr=0 ts=69c6ba26 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=ZUs9zOJhT6POFn0piIgA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-GUID: TvEOyG3-qzjbqlSklFyWZOLctShcP_7W
X-Proofpoint-ORIG-GUID: TvEOyG3-qzjbqlSklFyWZOLctShcP_7W
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDExOSBTYWx0ZWRfX03p5edKx/VOg
 JNEDdbgTseW4itgp4fyEHJ3dw15NwvbW89vjhb3nDMd15+/witgE7Yw40TPMsrk/tzpoh68hZ41
 LYjDNfzF6r6YHC73JhFMfoEbAbvV3I7WrJjSK9wKa3HzJRalp/xRWpTi903fqiLEigvY6lWGo4z
 9LHRVb5TnJbOLLIvAbxJTQBR+DabVAatoxUS9kqst0QHgEw1e7X4c/yaq7lyMA0oy1jTvMW2Tyr
 fyuISyfVQD4oDrC30IlK8XlA1C8f3CwM68NQ6wZqCqoW/RuDyJX83H7Q2Tr3owl/bavSMA/PhFC
 QNju8uU0aZ2YY4CwCcwzz5Wp2vNjy6sNXVtqNInkBZ/iuaf2n53bsX1CI0jKXVM0gT/bxWqmwnO
 zXK2obwbZEcR/IwUl3JyZ/0HqKZQ3pYciPBN/TKRrxyqSKpSCsUVRPMZknBj/2DR2PmeLcM0hMI
 XRZVcxv5xF66VR3GvkA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-27_01,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 spamscore=0 bulkscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270119
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100387-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[jeff.hugo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 059D434847E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 12/23/2025 10:02 AM, Youssef Samir wrote:
> From: Troy Hanson <thanson@qti.qualcomm.com>
> 
> Instead of storing and emitting bootlogs as individual null-terminated
> lines, concatenate them, and later emit them to debugfs in a single call.
> 
> Do not insert a null terminator on messages received from the device.
> Instead use the message length when subsequently storing the message.
> 
> Exclude trailing nulls to normalize AIC100 and AIC200 bootlog lines.
> 
> Signed-off-by: Troy Hanson <thanson@qti.qualcomm.com>
> Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>

Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>

