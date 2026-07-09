Return-Path: <linux-arm-msm+bounces-117886-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zSAREnNST2rJeQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117886-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 09:49:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8955C72DEFE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 09:49:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ca5aqJA5;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="c6/QT2qQ";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117886-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117886-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2F09A3035D59
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 07:46:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59F0E3D566F;
	Thu,  9 Jul 2026 07:46:18 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 620533C1406
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2026 07:46:12 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783583176; cv=pass; b=Ng/TkwftQfAqF0p1QR/F1F1OqsQGeGzfAQ+fjaNtvwHwR6dH3EpwbqkAH4wEaA9/e2F5TSW10JntO3GGIqDLe1BhNyjZWIDqkpmrm3wIeLJ+VxsgvFphhXQlrxOIcNvWnbf1rCxcuCObI+94sUp3LdnhDVqIeGmb6nmeyI2EHIg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783583176; c=relaxed/simple;
	bh=07wva2+HW2Xk8v4uN43Cx4PhQoeKjtx49ALQficpH+Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t7N/oQ3UdOeS/ERdzpgX6mM9x9Sai65Yvjgao51EX4bhC/OR6lHRgKKnSX5Qf0x7Leca179ex0K00DVHwlQ/gcfz02+UQk/Zg4EOr/L3cjZhtW1c8NGclxryrd3eE0ueP92/9I5avAyLKGQMXBKqvcUpPnCvQ+Xx49fGWBNCYK8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ca5aqJA5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c6/QT2qQ; arc=pass smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669600HU711005
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Jul 2026 07:46:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NhGxkCX28V4kHMRzxiw6nz0Sa/jpmcLA68qNhvWGngE=; b=ca5aqJA5NBD4tfAF
	yKnSTzw+vMLvpqGGwD/U8VkWR+Dmshjaq/96UQ4Tu+ENN/SFhVJ3Np+m5TbM11Ag
	Gcc1w9uMjI6mtzV7pDqYnRMRzmptfl2DsNs8EqyU9ToIOgO/h8i2qobqDjitDmZz
	4bZIejbD5Vr/lup7R2Rm31EMCUniKXE3gsIEniNoc0o2hQXtkmm7cfWDLQd1dLlm
	xZj3jRnb+1BG9HCpyt0KnqscZSYMdbZlZFO887tll6u86YwTxXe8s9dgUmgEZu/T
	eb1+9lPfEFA5/s7o+8UDK/zu9BiYa1iC7VU0O6+s/INuJ2MpLmCUTHwXf/UBlgEh
	9BtVLQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fa55vgkp7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 07:46:11 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e820609d9so59430885a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 00:46:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783583170; cv=none;
        d=google.com; s=arc-20260327;
        b=ehQSf1hf2uK97+gQtkSOYYIVtas5B7BUroB9O4Ss7m2BVR069Tr8dfYo1dScJxzOAD
         +Y3ZI3E8/J5dzsnnaTlDMw5V+M+z8gRsZMCXex7APr86pPAEdMx6uT9sXsoPqVZpkgum
         +jSSBDlAJbLpx5TeEOaIb1+pStz4/w8cF7cA9tGWGgvoYE19QDkA2Pr9DXNKIQBeh1or
         RJrFmeRahrKjzm5noNBrtFU8cfooUTQiuec59cFJVYpfjAhSckNIsHmC2d1P9CfZUvEK
         AOiI9jJzIbO6XL23y9CDyCiBUBnbV4dYWEsNi0unZmwo88jqJ9bnmGoiPI2xwlr+W6Y3
         zz3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NhGxkCX28V4kHMRzxiw6nz0Sa/jpmcLA68qNhvWGngE=;
        fh=ywVL1hjVTys64Qo5jfYEgVMD2jmBvfXtfJRM7lsk1wo=;
        b=CFXSV1EocCg/DnI6Vub0o2tzE1BtybeVac58AY+/ELgUEnGrWcWhscJJl7LdEJYR/6
         fq49U4UGmPuB2olHo2E2l5eB3qmFlohDchDybzSfE/VfxSv2r7uCiMoYqXreviwiZb+h
         K11yk6yqXWqDhoP7FtjKYRU1JCk8iX4PeGxv9wxY30c9Q9MlnxPPBcb6nHeREfBZyD0g
         0+3Z2Z7CR2PqsUBYg84SnTA779DlYmUSeIj3QVJ3NjuVZYLiVFb6TgO3bfmE7Ejcwzs5
         Cozldo+qASAzDNbnYlUMTbHNFtV8KHksYAhpMQuwVEvSHJiHH7HHMR3Q0gpS+DoaR0+T
         U2WQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783583170; x=1784187970; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NhGxkCX28V4kHMRzxiw6nz0Sa/jpmcLA68qNhvWGngE=;
        b=c6/QT2qQfoNXGfM35oBzWZNtQaxt08eTRwKWVlH3IiMxE1+zYfOiOdQQ1nflORUu8u
         y0n+5xVzeOQZov++dLZqJ8QIaRH7g2f6IHIJcBYiFNC7XEIhsMFhIur2TTWXuO51mrrP
         n8W654bnYby0s4+xPpGpjV7d+leyBjAm/pJNhzMSO9J6+H4I4gVlS0DUzdMimSB4UPpJ
         zEVZLX1pVwD8NnesMi4pn5gpPXwtRZUs8EDQAB8TTgUGmbdBRdQapPOV1rowEzKtivSX
         RDfd9IAJBojTKcL03xWaP46B5uO1VTNYcg1rwupYeiS0BrpD9RRbnAhN8TsmXqWuK5dU
         exNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783583170; x=1784187970;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NhGxkCX28V4kHMRzxiw6nz0Sa/jpmcLA68qNhvWGngE=;
        b=EdVIQBy93Qy4W3tWGrV4DhLwb+qzMtP6fBdaMnISmvFc6jsLd69oDu/6GgQ01s2KfZ
         Tv+NXSc/qs7o2brrvVMC707ioYV4wZrz9D3DEeCGuoOQp3RsNlav9QTN4jQOr279N03a
         E7Yb4rlmm8DLzwoJyFjD5hyzYxsl750YDRif49WsRXw/8SQLl4naFdt7878exPNXGmlg
         B6UzAL3CSJlkpji77uS0Jcj/rY+VN41SNr0kos3nlZ9rl6SLVP+dYYrEe1wBx+pt9+Qv
         mp6X5MEtbiasD1ASny/JLbBVD5UR46GFCkDT/XA0hdO5HVT6k/9Hf0rQUVyyazeT5QNm
         7LsA==
X-Forwarded-Encrypted: i=1; AHgh+RoBPCz74jZNLcPbcPc1tz7UXtpf0tD49y66aDUtOguRwWExcXzbomp2T3n59IKWa87V/thq+fHhf93Gv0WI@vger.kernel.org
X-Gm-Message-State: AOJu0YxHf6WfazfL39ZRSYBM9ibt94QkjHChZcldfjyNS9+0M+ORkdyk
	hWY5B/NK7IhPpfeN0CaDaJcv8TWVlLNwTzLy1wTml1dudfRrcT3O5i9hgqLoEM1FK/WHxYeeM2g
	fVQaq3JBMDKA0H1cLqHDxxnW+ZDxq6lXK234hj3yLqGqcnMLL69W2sqRnzMmQRG8+/0KdZreahA
	Ri0SCGWWDu7Pou2GZEoAvVZ0BBRIllGWbbcp3rfWpz1ZU=
X-Gm-Gg: AfdE7cmCvKopMnGlC1V+0Q/eB+JYRt8P+DH3/00eM0O0EKzGvrzJjPC5kjiTjKTCn5j
	ahgA8BEFIZlMRkJRlKiH+pC6LkWKu7JnHCL1hYMiimFdI9c0oKtVJI4FkR0+Noyo0Kc5aXQ+SK0
	HIamBcIUOllxQuEleIwXNLBCzOVmW5K/GY+tEgq/w0U+ZDKeM/eA5mb0Z3NacxzfjoIHZssMDAV
	KuwJabcl8A42V6z6dSBD7mT7csi2TernsO298PES1hzDjTjh7YfE2RNXDfTRahCT90i5sS1ww2J
	wkB8zRpsTA==
X-Received: by 2002:a05:6214:450b:b0:8ee:ff2e:c2f4 with SMTP id 6a1803df08f44-8fec557ab7dmr64350786d6.17.1783583170417;
        Thu, 09 Jul 2026 00:46:10 -0700 (PDT)
X-Received: by 2002:a05:6214:450b:b0:8ee:ff2e:c2f4 with SMTP id
 6a1803df08f44-8fec557ab7dmr64350496d6.17.1783583170002; Thu, 09 Jul 2026
 00:46:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260706071113.383215-1-atanas.filipov@oss.qualcomm.com>
 <20260706071113.383215-2-atanas.filipov@oss.qualcomm.com> <d579ffd2-b99e-4e8d-b2b7-e7e896b2d71d@linaro.org>
In-Reply-To: <d579ffd2-b99e-4e8d-b2b7-e7e896b2d71d@linaro.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 9 Jul 2026 09:45:58 +0200
X-Gm-Features: AVVi8CfzimAcZqI-0huc1ogOqlRyuYjOXyQidt826_gI6qT68v2jCz-ds2hC2iI
Message-ID: <CAFEp6-0rwuRzXM0fu0uyrvSvgG0ttpygOULkKfTT7aw8m_HUog@mail.gmail.com>
Subject: Re: [PATCH v4 1/5] media: qcom: camss: Populate CAMSS child devices
 via DT
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        linux-media@vger.kernel.org, vladimir.zapolskiy@linaro.org,
        mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDA3MiBTYWx0ZWRfX/W5twT0FczII
 yRFTlP3RMKX0BzPxjU+Lipz0YBprbYO6jtOGDWkVDexYHmXAZ5Wk/63obfuubGiGI9WMHTz6g6T
 A8cRk8H6xRfz49asqo/5CQ+GcR2MAr5KwC7y7JOhNK0pECKzg8OfUBTYs2zE9QDt1lB0zjHQ7DE
 9AgiOJ4UqaQy7Oa3rbWOePrwO70Q0DBtVPaigXTBTMcvQybek+GrgriZ1zTXIdYjEK8TdfAgx+k
 Bu2qjU2PeOl0hV4mxq18FIyMDAkuKkEUMAZc0J4pHGjWq1+24P1iWxXzjHKidewCi7L8EM/HopD
 xf4lRu97VjAOYSKEAEKVZ3N9lo1HlTJxW0G4j56zLiGKG3hYhpbTuvzSaz5VMZBcQz6G9gaYPDp
 twvh9YhZrIN/42UjXkgLrq5S5qiqyUQJVGrPWkiW8ZxU9sZGR0tS9j7Ycmay9IMpAZKSZP0SyxX
 yDzfy8BMqsH8OJ14yCw==
X-Authority-Analysis: v=2.4 cv=KfDidwYD c=1 sm=1 tr=0 ts=6a4f51c3 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=y-x-Ysk6LtgDBV_-dcYA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDA3MiBTYWx0ZWRfXyGBEsPD/jZRY
 NuCoLC50UyGukK1/jSRco3ROP8G8o0xOeSdoZJvK6JKRIzy0ah8G/mDtMuSy/7de4spxb1ZRZH1
 EW9/R95p6eAUMn88LstAJBvINIQOmPg=
X-Proofpoint-ORIG-GUID: TTE_Aw8QXs-pjs_eKHZNW3iY4Ec3Nkbi
X-Proofpoint-GUID: TTE_Aw8QXs-pjs_eKHZNW3iY4Ec3Nkbi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_01,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090072
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-117886-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:bryan.odonoghue@linaro.org,m:atanas.filipov@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:vladimir.zapolskiy@linaro.org,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,linaro.org:email,mail.gmail.com:mid,qualcomm.com:email,qualcomm.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8955C72DEFE

On Thu, Jul 9, 2026 at 12:30=E2=80=AFAM Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> On 06/07/2026 08:11, Atanas Filipov wrote:
> > From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> >
> > Use devm_of_platform_populate() so that child nodes declared under the
> > CAMSS device tree node (e.g. OPE) are automatically instantiated as
> > platform devices. This is required now that CAMSS is modelled as a
> > simple-bus and ISP blocks such as OPE are described as child nodes.
> >
> > Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> > Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
>
> Looking at my commit logs I see this isn't my commit message ..
>
> Anyway.
>
> > ---
> >   drivers/media/platform/qcom/camss/camss.c | 3 +++
> >   1 file changed, 3 insertions(+)
> >
> > diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/=
platform/qcom/camss/camss.c
> > index 2123f6388e3d..95e655a8b6aa 100644
> > --- a/drivers/media/platform/qcom/camss/camss.c
> > +++ b/drivers/media/platform/qcom/camss/camss.c
> > @@ -16,6 +16,7 @@
> >   #include <linux/of.h>
> >   #include <linux/of_device.h>
> >   #include <linux/of_graph.h>
> > +#include <linux/of_platform.h>
> >   #include <linux/pm_runtime.h>
> >   #include <linux/pm_domain.h>
> >   #include <linux/slab.h>
> > @@ -5362,6 +5363,8 @@ static int camss_probe(struct platform_device *pd=
ev)
> >       if (!camss)
> >               return -ENOMEM;
> >
> > +     devm_of_platform_populate(dev);
> > +
> >       camss->res =3D of_device_get_match_data(dev);
> >
> >       atomic_set(&camss->ref_count, 0);
>
> Just drop this patch entirely and model JPEG as a peer of CAMSS. I'll do
> the same with the CSIPHY and Loic the OPE.
>
> Modelling for subnodes is nice if you have the idea the camera block
> should be a bus.
>
> But for what reason ? As you pointed out it should be possible to both
> compile and run JPEG without the compat=3Dcamss node on sm8250.
>
> Making the camera block a bus is a nice idea for "reasons" as this
> thread has shown, its a problem to implement with an upside we struggle
> to define.
>
> When the facts change, I change my mind.
>
> You were right to argue to have this as a peer node. Lets do that.

Having a camera-subsystem bus/parent still makes sense, especially
when dealing with shared resources. Whether that should be the
existing camss node is indeed the question. Today, camss effectively
describes only the VFE (including the CSID) and CSIPHY, so using it as
the subsystem parent would introduce incorrect layering unless the
node is significantly reworked/broken. So yes, for now, keeping the
components as peers appears to be the simpler and more scalable
approach.

Regards,
Loic

