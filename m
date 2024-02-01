Return-Path: <linux-arm-msm+bounces-9293-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 969F18450D3
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Feb 2024 06:40:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4363D1F237C9
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Feb 2024 05:40:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28B2A5FB8B;
	Thu,  1 Feb 2024 05:40:30 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from 104-156-58-109.static.hvvc.us (104-156-58-109.static.hvvc.us [104.156.58.109])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31B465F861
	for <linux-arm-msm@vger.kernel.org>; Thu,  1 Feb 2024 05:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=104.156.58.109
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706766030; cv=none; b=J5kXzKPWyutrafAQiiaCd4mclNbV93EevnlHIToz0Mg7F/xVZVyCRc4au6aLgOm1YYMEXRFLgpd4PjU3fdsqytc38ln4+rONgPNTvPl8PbQELdYPTFloI67EAkGbY9EHHNUqDQezvsTN5gPXYdc4LFaeXcoJgmHf3J//ob37rMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706766030; c=relaxed/simple;
	bh=hMZfznZIl+K7XePS/iEYNwgTR15kUcj+cLt4gjTdm9g=;
	h=To:Subject:Date:Message-Id:From; b=PVt3zZzqbgkqgPSpNrg/oUjdk1WZkbC8cNf4Hv2jXMgin5vaoOarKcmF6i36RyL4wAICNO6EhhsP1z4k9xEvws1ryCviXG/EekL0ot+sXxTrUbXUBENa9oZ7zruR6R8zjSYDgYNSCUX2ZlhhUqTv+Fb9IBkddtIiPH9fmIiyLHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axon.co.in; spf=fail smtp.mailfrom=axon.co.in; arc=none smtp.client-ip=104.156.58.109
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axon.co.in
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=axon.co.in
Received: from axonnew by s65.sh.com with local (Exim 4.96.2)
	(envelope-from <info@axon.co.in>)
	id 1rVPOp-0005ve-2F
	for linux-arm-msm@vger.kernel.org;
	Thu, 01 Feb 2024 10:44:07 +0530
To: linux-arm-msm@vger.kernel.org
Subject: Enquiry Details
X-PHP-Script: axon.co.in/contact.php for 77.247.178.94
 X-PHP-Originating-Script: 1279:class.phpmailer.php
Date: Thu, 1 Feb 2024 05:14:07 +0000
 Return-Path: info@axon.co.in
 From: Axon <info@axon.co.in>
 Cc: Krithi Forms <krithi.forms@gmail.com>
 Reply-To: Axon <info@axon.co.in>
 Message-ID: <8eda3f63b1772a058be70cbfd23c4692@axon.co.in>
 X-Priority: 3
 X-Mailer: PHPMailer 5.2.4 (http://code.google.com/a/apache-extras.org/p/phpmailer/)
 MIME-Version: 1.0
 Content-Type: multipart/alternative;
 	boundary="b1_8eda3f63b1772a058be70cbfd23c4692"
Message-Id: <E1rVPOp-0005ve-2F@s65.sh.com>
From: info@axon.co.in
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - s65.sh.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [1279 993] / [47 12]
X-AntiAbuse: Sender Address Domain - axon.co.in
X-Get-Message-Sender-Via: s65.sh.com: authenticated_id: axonnew/from_h
X-Authenticated-Sender: s65.sh.com: info@axon.co.in
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>

--b1_8eda3f63b1772a058be70cbfd23c4692
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit

Name
										:
										
											wawbasia
									
									
										Email
										:
										linux-arm-msm@vger.kernel.org										
									
									
										Mobile
										:
										82757481399										
									

									
										Subject
										:
										I promised.										
									
									
										Message
										:
										Hi, this is Jeniffer. I am sending you my intimate photos as I promised. http://tinyurl.com/yuypmkfw#D91N2m										
									
									
										 
									
									
										
											
												Enquiry Details


--b1_8eda3f63b1772a058be70cbfd23c4692
Content-Type: text/html; charset=iso-8859-1
Content-Transfer-Encoding: 8bit


						<div style="background:#f5f5f5; width:600px; margin:5% auto; overflow:hidden; padding:5% 5%; border-radius:2px; font-size: 14px; font-family:Arial, Helvetica, sans-serif;">
							<div style="background:#ffffff; width:600px; margin:0% auto; overflow:hidden; padding:0% 0%; border-radius:2px; font-size: 14px; box-shadow: 0 2px 2px 0 rgba(0,0,0,0.14), 0 3px 1px -2px rgba(0,0,0,0.12), 0 1px 5px 0 rgba(0,0,0,0.2);">
								<div style="border-bottom: 1px solid #e0e0e0;border-radius:2px; padding:10px 0;" align="center">
									<img src="https://axon.co.in/images/logo.jpg" width="50%" />
								</div>
								<table width="100%" border="0" style=" padding:20px 30px; background:#ffffff;">
									<tr>
										<td width="153" valign="top" style="padding:5px"><strong>Name</strong></td>
										<td valign="top" width="19" style="padding:5px">:</td>
										<td width="414" valign="top" style="padding:5px; color:#333333;">
											wawbasia</td>
									</tr>
									<tr>
										<td valign="top" style="padding:5px"><strong>Email</strong></td>
										<td valign="top" width="19" style="padding:5px">:</td>
										<td valign="top" style="padding:5px; color:#333333;">linux-arm-msm@vger.kernel.org										</td>
									</tr>
									<tr>
										<td valign="top" style="padding:5px"><strong>Mobile</strong></td>
										<td valign="top" width="19" style="padding:5px">:</td>
										<td valign="top" style="padding:5px; color:#333333;">82757481399										</td>
									</tr>

									<tr>
										<td valign="top" style="padding:5px"><strong>Subject</strong></td>
										<td valign="top" width="19" style="padding:5px">:</td>
										<td valign="top" style="padding:5px; color:#333333;">I promised.										</td>
									</tr>
									<tr>
										<td valign="top" style="padding:5px"><strong>Message</strong></td>
										<td valign="top" width="19" style="padding:5px">:</td>
										<td valign="top" style="padding:5px; color:#333333;">Hi, this is Jeniffer. I am sending you my intimate photos as I promised. http://tinyurl.com/yuypmkfw#D91N2m										</td>
									</tr>
									<tr>
										<td>&nbsp;</td>
									</tr>
									<tr>
										<td colspan="3">
											<div style=" margin:0; background:#333333; color:#ffffff; text-align:center; padding:3px 0; border-radius:2px; font-size:13px;">
												Enquiry Details </div>
										</td>
									</tr>
								</table>
							</div>
						</div>
					



--b1_8eda3f63b1772a058be70cbfd23c4692--


