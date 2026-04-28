Return-Path: <linux-arm-msm+bounces-104994-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eOPeJE6w8GkfXQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104994-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 15:04:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E8F7A485781
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 15:04:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D3E1C309742A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 12:55:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7397943DA30;
	Tue, 28 Apr 2026 12:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OseKwjKD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EFkF9KKw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5B1842E012
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 12:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777380738; cv=none; b=EQmKdI1rfSu4U2HkuRq+ySI2kmitFM2e/QuVRVY4x+nlGzGl9L8Mu08wmk8LhZbfjp1hEChuNBlAgiCkIGgZluuoTmuNf69yOucClZfgRH9+OX2YLLu/oc3rtem2pUXm0E+Gd8Sw6cXT6SDu3rsrfR1XaZYAss31KeaHuF8sSe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777380738; c=relaxed/simple;
	bh=yy1G2x7ZbOhCmhyZ0L0UtzskcrB5jw2HMJt0sWko6z0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OhgbHfcQPOiHVsauwpSIj7SpcnOV7owpPj7ROTojCkcIfoyxtU15/P6QwJUsfJ4tXLu3DdDPWlTrfuLTUzYw+FePWwfl668utIYs/8v7Q81g9P7XPcY5HkCwCBC4shncTDfwN+y4BVaC5r61PAo4A3OqK5eZc7Li0ccs6YW+oBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OseKwjKD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EFkF9KKw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63SAs8CV2112789
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 12:52:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fuan7vpHDJmdEctZa38UzZ/S
	gPHsnWa1zkAu/XAf5ps=; b=OseKwjKDrdP+q5dR5FAVBWnyflhYY/Drg9YSJG7g
	eUAfPi3bhOjKWT8RbWYthJqeoL9NrG/eYddclzIG03lwaNd8oS/+6OdE647hwL3M
	4d7s0DT6Ct+4apghqaYFx+byV2USOwT7/9ZLkr3Vuydzn8z5AinRhz6mYa3mqWw7
	4HQq4Q8VTYa1ZPSqboith/g6lS7ewDq29n9o3EMTrmOjdsgWJmwwjRVY60ZLv2LA
	P78xd1mTYAyg6VizROdECjuOWshfuTbQtMoCR4V4XzWZx+tlJ9/H7NVTOcgTEnWV
	he8FdxMWvL9ipl9Zg8NwITSfmrxUUQAs1P8orTEdGPwJow==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtdmbkjyj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 12:52:14 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2d8c521be48so7535549eec.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 05:52:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777380733; x=1777985533; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fuan7vpHDJmdEctZa38UzZ/SgPHsnWa1zkAu/XAf5ps=;
        b=EFkF9KKw7l99aydPg4pZLMt+A7FvR65l7xkit/tVoQlZLblgGJ0JF6plsTengJwueV
         /OVX8a++Cv9/b0NIBnObopicDwOhdUUpqq8hrfOQaxURnRMrJMDl/EqeWPYQDCz6QrzG
         U8kfjj6rxa6P4jLZo6UdE3vF2u0w1toXJls3xynrZU6ZZbi+ynjauipUl4+hyEfeueKD
         asyrvipqRqvN6YTRmRyXXvy+9XI5xKNuNUq/Vadms4EqFVOBNyH0ZTP+dXLQcZE0Wrmr
         vkaLUT+66QRLdCpGAsOF1HFZDphYu23JC2lEyENEIy9gS/LlGqtQBL4KHlJyym/5ttny
         qs+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777380733; x=1777985533;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fuan7vpHDJmdEctZa38UzZ/SgPHsnWa1zkAu/XAf5ps=;
        b=ik/qdYrBYP5PUytMTQMBzhl2UrnChjKHo/7slS5EbzMo8pzmbS6rqcHiXY0Xkc0ZMy
         vRpJlDKn5KVRf56Gh9ill4e48+ZVCv1y3aa8BVX4pw/2MkY/No7o6bRUcDpyvMJWPcCw
         zv8gwg+Ge9x+QnZbFNeTGchYYiEUhLhZ1ZL/PNBaI7ZgTRq5ZMYVyqvw1OsXV4VJqjo1
         74BARSp/b4NIsEATZKSthd/W/wFaJ23PYsfghoqnbtOmUDltjdJE38+39GhCofA5FxOj
         yQFfTvZ276ijEtpl6y4UyB9122mJRjHK6lwBFWwl4gV8qDkI6BUD68n4wCHuW8c4y9K1
         bzOA==
X-Forwarded-Encrypted: i=1; AFNElJ+NrhQjodXUAWs2N7t6reWBGCqvVs1T9HOkO7+5hFRatofNc3f5LYw/TIzCrMaPGDjgmrGspihYfEsv8QKy@vger.kernel.org
X-Gm-Message-State: AOJu0YwmSmBYYiO4Um8C+NmIKeIX35evJW5JQetOP4bR5+WqowwghTaW
	5HDnlDtfYlNrURGv8yQeZY56NFq5ms/c5TfdGK0K6iH1ED9fb54r40VrH1qQIX627+3a7f1i64B
	SRXj0+GTSDeTQK9XSF4kcK4HiwuiIL2n0BawYuYutha/HIwFneZ7Af7gLDJCqJajCVbuH
X-Gm-Gg: AeBDiev7kz1EKTGXu+bvaz9Jk3mGNlSgOMYAdM7TtvxdvT1VEb8REv6FFamfaLlReVo
	TXhWnjhIuhJK4zD9rJSVfXimF3RbREwxaiygmA3HpTyrkrI6u466Ynh5zJXnLUB8ImhZbx9qQ4X
	FyrBgW2qBpkRRHXm+yTS5l7qGEKiHcUEBsfT/3NtnRq6AlQWuzJig8LcatLXiivCDJtgfhMfpWO
	etk/gj/gWsL4ZmKdq4/DEBb5KESMFjtsYr7LP6DNH8WT3ZkKz7j6JR3tEYf0VNAXTeSanlQXbdj
	3JFW6RgNdkFD568Xk6eEZe2ZNUWbuj0SE8Y1rY08UjXb17+cl4pa3xQXhDkKS4TYYJHAdPSOVR5
	3dgZOsXTREg/mTybInzUF3ajvA3jZgBVA0d93nPseUOv75bbP2/wM97PynRDpBrJ6TpEkb5A60o
	0=
X-Received: by 2002:a05:7300:a985:b0:2c5:c532:1fe1 with SMTP id 5a478bee46e88-2ed0a3e392cmr1341461eec.3.1777380733191;
        Tue, 28 Apr 2026 05:52:13 -0700 (PDT)
X-Received: by 2002:a05:7300:a985:b0:2c5:c532:1fe1 with SMTP id 5a478bee46e88-2ed0a3e392cmr1341449eec.3.1777380732632;
        Tue, 28 Apr 2026 05:52:12 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ed0a13ebf5sm2150541eec.27.2026.04.28.05.52.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 05:52:12 -0700 (PDT)
Date: Tue, 28 Apr 2026 20:52:06 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: mfd: qcom,tcsr: Add compatible for Nord
Message-ID: <afCtdoJrcvTMmyKo@QCOM-aGQu4IUr3Y>
References: <20260427012116.231226-1-shengchao.guo@oss.qualcomm.com>
 <20260428-qualified-pronghorn-of-success-ceb0ec@quoll>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260428-qualified-pronghorn-of-success-ceb0ec@quoll>
X-Proofpoint-GUID: Q2QhLzGNrxDI6XCBSChUkPUFgmHpKxtp
X-Authority-Analysis: v=2.4 cv=PcrPQChd c=1 sm=1 tr=0 ts=69f0ad7e cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=l8WEheMYnMOxm2Lny4kA:9 a=CjuIK1q_8ugA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: Q2QhLzGNrxDI6XCBSChUkPUFgmHpKxtp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDExNyBTYWx0ZWRfX2SgyFhzXCr5q
 2ffcBwH85JWhU2b6GDZM7B8EH68vUk1/luGeSe/bty/cKy6whWiDNrP3SzVwQv+oUGlbAmm1p+H
 2Dkbf7CVXi60wxbXoiWaDvoa/tFTk6Z6I7Znas3+87qbL7w07zLy7Y68LuceW2bXnPcvJ3Cwt+k
 cne3Re6f6Tgur06ZwMmHJ1QFIk4FTFCBgbGc8i5ET4gedASe25C7fawxISv0rKqAuMsQxaLs1DN
 IwHrpMFiPetTPVK6RqWDe8XYgcgzd2pCslVdmM0G+LGzOUloUQryt81nZLqYMlTQrlTAg6pHHFK
 8NXAsAI8F+O7Xkaqiz3V41GiZWsC1OcmoRgquisLmvQr2gI0665N4TKNIDCisjWy1aK/zpl8QPi
 O4QFRsg/X0WV+gNf/jKoFWyuyvCmKJxpGkysY90fIjcXUbboH225RZPldtaocSCSXy5atZYSMmD
 NZVV2VBiSioRWq7cwXw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_04,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 adultscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604280117
X-Rspamd-Queue-Id: E8F7A485781
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104994-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

On Tue, Apr 28, 2026 at 08:18:37AM +0200, Krzysztof Kozlowski wrote:
> On Mon, Apr 27, 2026 at 09:21:16AM +0800, Shawn Guo wrote:
> > From: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> > 
> > Document Top Control and Status Register controller on Qualcomm Nord SoC
> > which is compatible with 'syscon'.
> 
> TCSR is not compatible with syscon, because there is no such device as
> syscon. That's Linuxism. One device cannot be compatible with non-device
> Linuxism.
> 
> Few other commits also are not helping - you keep repeating the binding,
> that device is compatible with some other "compatible". But we
> never asked for it.

Ok, I will just drop it.

Shawn

